//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Frédéric Helfer on 03/10/22.
//

import Foundation


extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
