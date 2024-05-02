package com.utils;

import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

public class AppUtils {
	public static String formatPrice(int price) {
		Locale locale = new Locale("vi", "VN");
		Currency currency = Currency.getInstance("VND");
		
		DecimalFormatSymbols df = DecimalFormatSymbols.getInstance(locale);
		df.setCurrency(currency);
		
		NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
		numberFormat.setCurrency(currency);
		return numberFormat.format(price);
		
	}
}
