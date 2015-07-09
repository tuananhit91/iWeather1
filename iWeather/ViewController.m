//
//  ViewController.m
//  iWeather
//
//  Created by admin on 7/8/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperature;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ.", @"Có công mài sắt có ngày nên kim.", @"Đi một ngày đàng học một sàng khôn.", @"Trên con đường dẫn đến thành công không có dấu chân của kẻ lười biếng.", @"Việc hôm nay chớ để ngày mai, đừng để sự trì hoãn làm hỏng mọi việc."];
    
    locations = @[@"Sydney, Australia", @"Paris, France", @"Tokyo, Japan", @"New York, USA", @"London, England", @"Berlin, Germany"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}
- (float) getTemperature{
    return 1.0 + arc4random_uniform(40) + (float)arc4random() /(float) INT32_MAX;
}
- (IBAction)convertTemperature:(id)sender {
    // chuyển kiểu string sang number.
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc]init];
    //titlelabel : trả lại tiêu đề và hình ảnh, sẽ luôn tạo ra chúng nếu cần thiết , luôn trả về nil cho nút button.
    float number1 = [[numberFormatter numberFromString:self.temperature.titleLabel.text]floatValue];
    float number2 = number1 * 1.8 + 32.0;
    if ([self.labelTemperature.text isEqual:[NSString stringWithFormat:@"C"]]) {
        self.labelTemperature.text = [NSString stringWithFormat:@"F"];
        NSString* string1 = [NSString stringWithFormat:@"%3.1f",number2];
        [self.temperature setTitle:string1 forState:UIControlStateNormal];
    }else{
        self.labelTemperature.text = [NSString stringWithFormat:@"C"];
        NSString* string2 = [NSString stringWithFormat:@"%3.1f",(number1 - 32.0)/1.8];
        [self.temperature setTitle:string2 forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
