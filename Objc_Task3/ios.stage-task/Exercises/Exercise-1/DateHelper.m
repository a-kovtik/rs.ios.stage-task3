#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber <1 || monthNumber >12) {return nil;}
    return [[NSDateFormatter new] monthSymbols][monthNumber - 1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-DD'T'HH:mm:ss'Z"];

    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EE"];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *cal = [NSCalendar currentCalendar];
       NSInteger curWeek = [cal component:NSCalendarUnitWeekOfMonth fromDate:[NSDate now]];
       NSInteger myWeek = [cal component:NSCalendarUnitWeekOfMonth fromDate: date];
       if (curWeek == myWeek)
           return YES;
    return NO;
}

@end
