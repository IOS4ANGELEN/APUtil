//
//  APUtil+Dates.h
//  Latte
//
//  Created by Flavio Torres on 6/05/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger,APIntervalo) {
    APIntervaloNunca = 0,
    APIntervaloDia = 1,
    APIntervaloSemana = 2,
    APIntervaloQuinzena = 3,
    APIntervaloMes = 4,
    APIntervaloAno = 5
};

@interface NSDate (APUtil)

/// Convert NSDate to a formated string using pt-br locale, exemplo: segunda-feira, 27/jan/14
- (NSString*) stringFormatedAsBR __attribute__((deprecated("use method stringFormat:")));

///
- (NSString*) stringFormat;

/// Convert NSDate to a formated string using current locale, exemplo: segunda-feira, 27/jan/14
- (NSString*) stringFormatPlusWeekDay;

/// Convert NSDate to a formated string using current locale, exemplo: segunda-feira, 27/jan/14
- (NSString*) stringFormatPlusWeekDayExtended;

/// Convert NSDate to a formated string using current locale, exemplo: segunda-feira, 27/jan/14 11:30
- (NSString*) stringFormatPlusTime;

/// Convert NSDate to a formated string using pt-br locale, exemplo: segunda-feira, 27/jan/14 17:20
- (NSString*) stringFormatedAsBRExtended;

/// Returns formated string showing time from date until now
- (NSString*) elapsedTimeUntilNowFormatedAsBR;

/// Returns formated string showing time from date until now
- (NSString*) elapsedTimeUntilDate: (NSDate*) date isAge:(BOOL) isAge;

/// Returns formated string showing hours and minutes from date
- (NSString*) elapsedMinutesUntilDate: (NSDate*) date;

/// Dias de intervalos entre duas datas
- (NSInteger) daysBetweenFutureDate: (NSDate*) futureDate;

/// Meses de intervalos entre duas datas
- (NSInteger) monthsBetweenFutureDate: (NSDate*) futureDate;

/// Anos de intervalos entre duas datas
- (NSInteger) yearsBetweenFutureDate: (NSDate*) futureDate;

/// Compara duas datas ignorando o componente hora
- (NSComparisonResult) compareIngnoringTimeComponent: (NSDate*) otherDate;

/// Today at first second of the day
+ (NSDate*) today;

/// Returns YES if the receiver is today
- (BOOL) isToday;

/// Returns YES if the receiver is later than NOW
- (BOOL) isLate;

/// Cria uma data usando miliseconds
+ (NSDate*) dateWithTimeIntervalSince1970InMiliseconds: (NSTimeInterval) timeIntervalInMiliseconds;

- (NSString*) mesString;

- (NSString*) anoString;

//Retorna um objecto NSDate com "months" meses de diferença de hoje
//Assinale YES to endOfMonth para receber o ultimo segundo daquele mes
+ (NSDate*) dateOffsetOfMonths: (NSNumber*) months
                     backwards: (BOOL) back
            atTheEndOfTheMonth: (BOOL) endOfMonth;

- (NSDate *)dateByAddingYears:(NSInteger)years months:(NSInteger)months days:(NSInteger)days;
- (NSDate *)dateByAddingHours:(NSInteger) hours;
- (NSDate *)dateByAddingMonths:(NSInteger) months backwards:(BOOL) backwards;
- (NSDate *)dateByAddingDays:(NSInteger) days backwards:(BOOL) backwards;

+ (NSDate *)beginningOfDay:(NSDate *)date;
+ (NSDate *)endOfDay:(NSDate *)date;

- (NSDate*) dateByIgnoringTime;

//Convert NSString to a NSDate using pt-br locale
+ (NSDate*) dateFromStringFormatedAsBR: (NSString*) date;

/// Convert NSString formated as "2005-10-22 03:00:00 +0000" to a NSDate
+ (NSDate*) dateFromString: (NSString*) dateString;

/// Retorna o numero de dias dentro de um intervalo
+ (NSInteger) diasEmIntervalo: (APIntervalo) intervalo;

+ (NSString*) hoje;

+ (NSString*) stringFromIntervalo: (APIntervalo) intervalo plural:(BOOL) plural;

+ (APIntervalo) intervaloFromString: (NSString*) intervaloString;

- (NSString*) timeStringFormat;


#pragma mark - Deprecated

//Mesma coisa agora para dias e recebe uma data como referencia
+ (NSDate*) date: (NSDate*) aDate
    OffsetOfDays: (NSNumber*) days
       backwards:(BOOL) back __attribute__((deprecated("use method -dateByAddingYears:months:days. First deprecated in 1.5")));

@end
