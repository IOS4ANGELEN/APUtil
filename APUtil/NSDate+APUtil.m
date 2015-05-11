//
//  APUtil+Dates.m
//  Latte
//
//  Created by Flavio Torres on 6/05/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "NSDate+APUtil.h"
#import "NSString+APUtil.h"

@implementation NSDate (APUtil)

//desta forma o objecto não precisa ser recriado para cada vez que é necessário um dataformater
//NSDateFormatter é um objeto "caro" de se criar
+ (NSDateFormatter*) currentLocalFormatter
{
    static NSDateFormatter* formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc]init];
        //NSLocale *brLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
        [formatter setLocale:[NSLocale currentLocale]];
    });
    return formatter;
}

- (BOOL) isToday {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    return [today isEqualToDate:otherDate];
}


- (BOOL) isLate {
    if ([[self laterDate:[NSDate date]]isEqualToDate:self]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSDate*) today {
    return [[NSDate date]dateByIgnoringTime];
}


- (NSString*) stringFormatedAsBR {
    
    NSString* formatedString;
    if ([self isToday]) {
         [[NSDate currentLocalFormatter] setDateFormat:@"'hoje', dd/MMM/yy"];
        formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    } else {
        [[NSDate currentLocalFormatter] setDateFormat:@"EEE, dd/MMM/yy"];
        formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    }
    
    return formatedString;
}

- (NSString*) stringFormatPlusWeekDay {
    
    NSString* formatedString;
    NSString* hoje = NSLocalizedString(@"hoje", nil);
    if ([self isToday]) {
        NSString* dateFormat = [NSString stringWithFormat:@"'%@', dd/MMM/yy",hoje];
        [[NSDate currentLocalFormatter] setDateFormat:dateFormat];
        formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    } else {
        [[NSDate currentLocalFormatter] setDateFormat:@"EEE, dd/MMM/yy"];
        formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    }
    
    return formatedString;
}

- (NSString*) stringFormatPlusWeekDayExtended {
    [NSDate currentLocalFormatter].dateStyle = NSDateFormatterFullStyle;
    return [[NSDate currentLocalFormatter] stringFromDate:self];
}

- (NSString*) stringFormat {
    
    NSString* formatedString;
   
    if ([self isToday]) {
        formatedString = NSLocalizedString(@"hoje", nil);
    
    } else {
        NSString* dateFormat = [NSString stringWithFormat:@"dd/MMM/yy"];
        [[NSDate currentLocalFormatter] setDateFormat:dateFormat];
        formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    }
    
    return formatedString;
}

- (NSString*) timeStringFormat {
    NSString* dateFormat = [NSString stringWithFormat:@"HH:mm"];
    [[NSDate currentLocalFormatter] setDateFormat:dateFormat];
    return [[NSDate currentLocalFormatter] stringFromDate:self];
    
}

- (NSString*) stringFormatPlusTime {
    
    NSString* formatedString;
    NSString* hoje = NSLocalizedString(@"hoje", nil);
    if ([self isToday]) {
        NSString* dateFormat = [NSString stringWithFormat:@"'%@' HH:mm",hoje];
        [[NSDate currentLocalFormatter] setDateFormat:dateFormat];
        formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    } else {
        [[NSDate currentLocalFormatter] setDateFormat:@"dd/MMM/yy HH:mm"];
        formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    }
    
    return formatedString;
}

- (NSString*) mesString {
    
    [[NSDate currentLocalFormatter] setDateFormat:@"MMMM"];
    return [[NSDate currentLocalFormatter] stringFromDate:self];
}

- (NSString*) anoString {
    
    [[NSDate currentLocalFormatter] setDateFormat:@"yyy"];
    return [[NSDate currentLocalFormatter] stringFromDate:self];
}


- (NSString*) stringFormatedAsBRExtended {
    
    NSString* formatedString;
    [[NSDate currentLocalFormatter] setDateFormat:@"EEEE, dd/MMM/yy HH:mm"];
    formatedString = [[NSDate currentLocalFormatter] stringFromDate:self];
    return formatedString;
}


+ (NSDate*) dateFromStringFormatedAsBR: (NSString*) formatedString {
    NSDate* date;
    formatedString = [[formatedString noWhiteSpacesAndNewLine] stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    
    if ([formatedString length] > 8)
        [[NSDate currentLocalFormatter] setDateFormat:@"dd-MM-yyyy HH:mm"];
    else
        [[NSDate currentLocalFormatter] setDateFormat:@"dd-MM-yy HH:mm"];
    
    //Incluido para evitar bug com mudança de horário de verão
    //http://stackoverflow.com/questions/13055478/nsdateformatter-return-different-results-depending-on-ios-version
    formatedString = [formatedString stringByAppendingString:@" 1:00"];
    
    if (formatedString)
        date = [[NSDate currentLocalFormatter] dateFromString: formatedString];
    
    if (!date)
        NSLog(@"Error with Date: %@",formatedString);
    
    return date;
}

+ (NSDate*) dateFromString: (NSString*) dateString {
    NSDate* date;
    dateString = [[dateString noWhiteSpacesAndNewLine] stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    [[NSDate currentLocalFormatter] setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    
    if (dateString)
        date = [[NSDate currentLocalFormatter] dateFromString: dateString];
    
    if (!date)
        NSLog(@"Error with Date: %@",dateString);
    
    return date;
}


- (NSString*) elapsedTimeUntilNowFormatedAsBR {

    return [self elapsedTimeUntilDate:[NSDate date] isAge:YES];
}

- (NSString*) elapsedTimeUntilDate: (NSDate*) date isAge:(BOOL) isAge {
    
    NSString* formatedString;
    
    //    // check wheather date is in the future
    //    if ([[self earlierDate:date] isEqualToDate:self])
    //    {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                                   fromDate:self
                                                                     toDate:date
                                                                    options:0];
    NSInteger days = ABS(components.day);
    NSInteger months = ABS(components.month);
    NSInteger years = ABS(components.year);
    
    if (years == 0 && months ==0) {
        
        
        if (days == 0) {
            if (isAge) {
                formatedString = @"recem-nascido";
            } else {
                formatedString = @"Menos de 1 dia";
            }
        } else {
            formatedString = [NSString stringWithFormat:@"%li %@",
                              (long)days,
                              (days == 1)?@"dia":@"dias"];
        }
    }
    else if (years == 0 && months > 0)
        formatedString = [NSString stringWithFormat:@"%li %@ e %li %@",
                          (long)months,
                          (months == 1)?@"mes":@"meses",
                          (long)days,
                          (days == 1)?@"dia":@"dias"];
    else if (years > 0 && months == 0)
        formatedString = [NSString stringWithFormat:@"%li %@",
                          (long)years,
                          (years == 1)?@"ano":@"anos"];
    else
        formatedString = [NSString stringWithFormat:@"%li %@ e %li %@",
                          (long)years,
                          (years == 1)?@"ano":@"anos",
                          (long)months,
                          (months == 1)?@"mes":@"meses"];
    // }
    return formatedString;
}


- (NSString*) elapsedMinutesUntilDate: (NSDate*) date {
    if (!date) return nil;
    
    NSTimeInterval minutes = floor((date.timeIntervalSince1970 - self.timeIntervalSince1970) / 60);
    
    NSString* formatedString = [NSString stringWithFormat:@"%.0f %@",
                                minutes,
                                (minutes == 1)?@"minuto":@"minutos"];
    
    return formatedString;
}


+ (NSDate*) dateOffsetOfMonths:(NSNumber*) months backwards:(BOOL) back atTheEndOfTheMonth: (BOOL) endOfMonth
{
    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offset = [[NSDateComponents alloc] init];
    
    if (endOfMonth)
    {
        //Caso o valor requisitado seja o final do mes
        //Caso o offset seja negativo, setamos o mes para months - 1 e voltamos 1 segundo
        //Caso o offset seja positivo, vice versa
        [offset setMonth:(back)?([months integerValue] * -1) -1:[months integerValue]+1];
        [offset setSecond:(back)? 1:-1];
    }
    else
    {
        [offset setMonth:(back)?[months integerValue]*-1:[months integerValue]];
    }
    return  [gregorian dateByAddingComponents:offset
                                       toDate:today
                                      options:0];
    
}

+ (NSDate*) date: (NSDate*) aDate OffsetOfDays:(NSNumber*) days backwards:(BOOL) back {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offset = [[NSDateComponents alloc] init];
    
    
    //Caso o valor requisitado seja o final do mes
    //Caso o offset seja negativo, setamos o mes para months - 1 e voltamos 1 segundo
    //Caso o offset seja positivo, vice versa
    [offset setDay:(back) ? ([days integerValue] * -1) -1 : [days integerValue]+1];
    [offset setSecond:(back)? 1:-1];
    
    return  [gregorian dateByAddingComponents:offset
                                       toDate:aDate
                                      options:0];
    
}

- (NSDate *)dateByAddingYears:(NSInteger)years months:(NSInteger)months days:(NSInteger)days {
    
    NSDateComponents* dateComponents = [[NSDateComponents alloc]init];
    
    [dateComponents setYear:years];
    [dateComponents setMonth:months];
    [dateComponents setDay:days];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}


- (NSDate *)dateByAddingHours:(NSInteger) hours {
    
    NSDateComponents* dateComponents = [[NSDateComponents alloc]init];
    [dateComponents setHour:hours];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger) days backwards:(BOOL) backwards {
    
    NSDateComponents* dateComponents = [[NSDateComponents alloc]init];
    [dateComponents setDay:(backwards) ?  days * - 1 : days];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger) months backwards:(BOOL) backwards {
    
    NSDateComponents* dateComponents = [[NSDateComponents alloc]init];
    [dateComponents setMonth:(backwards) ?  months * - 1 : months];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}


- (NSInteger) daysBetweenFutureDate: (NSDate*) futureDate {
    
    NSDateComponents *components;
    components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay
                                                 fromDate: self
                                                   toDate: futureDate options: 0];
    return [components day];
    
}

- (NSInteger) monthsBetweenFutureDate: (NSDate*) futureDate {
    NSDateComponents *components;
    components = [[NSCalendar currentCalendar] components: NSCalendarUnitMonth
                                                 fromDate: self
                                                   toDate: futureDate options: 0];
    return [components month];

    
}


- (NSInteger) yearsBetweenFutureDate: (NSDate*) futureDate {
    
//    NSTimeInterval secondsBetween = [futureDate timeIntervalSinceDate:self];
//    return [NSNumber numberWithFloat:secondsBetween / (60*60*24*365)];
    
    NSDateComponents *components;
    components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay
                                                 fromDate: self
                                                   toDate: futureDate options: 0];
    return [components year];
}

//----------------------------------------------------------------
// Retirado de: http://stackoverflow.com/questions/1854890/comparing-two-nsdates-and-ignoring-the-time-component
//----------------------------------------------------------------
- (NSComparisonResult) compareIngnoringTimeComponent: (NSDate*) otherDate {
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    
    NSDate* myDateOnly = [calendar dateFromComponents:[calendar components:flags fromDate:self]];
    NSDate* otherDateOnly = [calendar dateFromComponents:[calendar components:flags fromDate:otherDate]];
    
    return [myDateOnly compare:otherDateOnly];
}

+ (NSInteger) diasEmIntervalo: (APIntervalo) intervalo {
    switch (intervalo) {
        case APIntervaloDia:
            return 1;
        case APIntervaloSemana:
            return 7;
        case APIntervaloQuinzena:
            return 15;
        case APIntervaloMes:
            return 30;
        case APIntervaloAno:
            return 365;
        case APIntervaloNunca:
            return 0;
        default:
            return 0;
    }
}


+ (NSString*) hoje {
    
    [[NSDate currentLocalFormatter] setDateStyle:NSDateFormatterFullStyle];
    [[NSDate currentLocalFormatter] setTimeStyle:NSDateFormatterShortStyle];
    
    NSString* formatedDate = [[NSDate currentLocalFormatter] stringFromDate:[NSDate date]];
    return formatedDate;
}


+ (NSDate*) dateWithTimeIntervalSince1970InMiliseconds: (NSTimeInterval) timeIntervalInMiliseconds {
    return [NSDate dateWithTimeIntervalSince1970: timeIntervalInMiliseconds / 1000];
}


+ (NSString*) stringFromIntervalo: (APIntervalo) intervalo plural:(BOOL) plural {
    switch (intervalo) {
        case APIntervaloDia:
            return (plural) ? @"dias" : @"dia";
        case APIntervaloSemana:
            return (plural) ? @"semanas" : @"semana";
        case APIntervaloQuinzena:
            return (plural) ? @"quinzenas" : @"quinzena";
        case APIntervaloMes:
            return (plural) ? @"meses" : @"mês";
        case APIntervaloAno:
            return (plural) ? @"anos" : @"ano";
        case APIntervaloNunca:
            return (plural) ? @"nunca" : @"nunca";
        default:
            return (plural) ? @"??" : @"?";
    }
}


+ (APIntervalo) intervaloFromString: (NSString*) intervaloString {
    
    APIntervalo intervalo;
    
    if ([[intervaloString lowercaseString] isEqualToString:@"dia"] ||
        [[intervaloString lowercaseString] isEqualToString:@"dias"]) {
        intervalo = APIntervaloDia;
        
    } else if ([[intervaloString lowercaseString] isEqualToString:@"semana"] ||
               [[intervaloString lowercaseString] isEqualToString:@"semanas"]) {
        intervalo = APIntervaloSemana;
        
    } else if ([[intervaloString lowercaseString] isEqualToString:@"quinzena"] ||
               [[intervaloString lowercaseString] isEqualToString:@"quinzenas"]) {
        intervalo = APIntervaloQuinzena;
        
    } else if ([[intervaloString lowercaseString] isEqualToString:@"mês"] ||
               [[intervaloString lowercaseString] isEqualToString:@"meses"]) {
        intervalo = APIntervaloMes;
        
    } else if ([[intervaloString lowercaseString] isEqualToString:@"ano"] ||
               [[intervaloString lowercaseString] isEqualToString:@"anos"]) {
        intervalo = APIntervaloAno;
        
    } else if ([[intervaloString lowercaseString] isEqualToString:@"nunca"]) {
        intervalo = APIntervaloNunca;
        
    } else {
        intervalo = -1;
    }
    
    return intervalo;

}


- (NSDate*) dateByIgnoringTime {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSUInteger preserveComps = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear);
    NSDateComponents* comps = [calendar components:preserveComps fromDate:self];
    return [calendar dateFromComponents:comps];
}


+ (NSDate *)beginningOfDay:(NSDate *)date {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:date];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [cal dateFromComponents:components];
    
}

+ (NSDate *)endOfDay:(NSDate *)date {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:date];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [cal dateFromComponents:components];
}

@end
