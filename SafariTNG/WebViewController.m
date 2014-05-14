//
//  ViewController.m
//  SafariTNG
//
//  Created by Joanne McNamee on 5/14/14.
//  Copyright (c) 2014 JMWHS. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self gotoURLString:@"http://www.mobilemakers.co"];

}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

     -(void) webViewDidFinishLoad:(UIWebView *)webView
     {
         [self.spinner stopAnimating];
     }

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"loading failed:";
    alert.message = error.localizedDescription;
    [alert addButtonWithTitle:@"That Sucks!"];
    [alert addButtonWithTitle:@"Go Home"];
    alert.delegate = self;
    [alert show];
    [self.spinner stopAnimating];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self gotoURLString:@"http://www.mobilemakers.co"];
    }
}

-(void) gotoURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
}

-(BOOL)textFieldShouldReturn:(UITextField * )textField
{
    [self gotoURLString:textField.text];
    [textField resignFirstResponder];
    return YES;


}

@end
