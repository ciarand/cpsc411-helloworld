//
//  main.m
//  cpsc411-assignment-a
//
//  Created by Ciaran Downey on 8/27/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import <Foundation/Foundation.h>

NSFileHandle *std_out;

// lazy helpers
void setup() {
    std_out = [NSFileHandle fileHandleWithStandardOutput];
}

void teardown() {
    [std_out closeFile];
}

// NSLog actually logs - includes timestamp details and other things, we just
// need a simple print function (which Obj-C doesn't provide normally?)
void print(NSString *str) {
    [std_out writeData: [str dataUsingEncoding:NSUTF8StringEncoding]];
}


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        setup();

        print(@"Enter your string: ");

        // since we're using scanf to read it in, we need a true C string
        // "127 characters should be enough for anyone"
        char buf_str[128];
        scanf("%127s", buf_str);
        // but we'll still store it in an NSString later on
        NSString *uinput = [[NSString alloc] initWithCString:buf_str encoding:NSUTF8StringEncoding];

        // print that stuff + some formatting
        print(@"Your string was: ");
        print(uinput);
        print(@"\n");

        // now print the date + time
        print(@"The current date and time is: ");
        NSDate *date = [[NSDate alloc] init];
        print([date descriptionWithCalendarFormat:@"%Y-%m-%d %H:%M:%S" timeZone:nil locale:nil]);
        print(@"\nGoodbye!\n");

        teardown();

    }

    return 0;
}
