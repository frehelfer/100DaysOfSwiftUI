//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Frédéric Helfer on 11/11/22.
//

import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var isShowingConfirmationDialog = false
    
    let filter: FilterType
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        if filter == .none {
                            Label(prospect.isContacted ? "Contacted" : "Uncontacted", systemImage: prospect.isContacted ? "person.crop.circle.badge.checkmark" : "person.crop.circle.badge.exclamationmark")
                                .labelStyle(.iconOnly)
                                .font(.title)
                                .foregroundColor(prospect.isContacted ? .green : .yellow)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            prospects.delete(of: prospect)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)

                    }
                    .swipeActions(edge: .leading) {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                            
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)

                            
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingConfirmationDialog = true
                    } label: {
                        Label("Sort type", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingScanner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Frédéric Helfer\nfre.helfer@gmail.com", completion: handleScan)
            }
            .confirmationDialog("How do you want to sort", isPresented: $isShowingConfirmationDialog) {
                Button("Sort by name") { prospects.sorted(by: .name) }
                Button("Sort by most recent") { prospects.sorted(by: .mostRecent) }
            }
        }
    }
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let success):
            let details = success.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            prospects.add(person)
        case .failure(let failure):
            print("Scanning failed: \(failure.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 9, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh!")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
