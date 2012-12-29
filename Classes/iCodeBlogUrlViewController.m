//
//  iCodeBlogUrlViewController.m
//  iCodeBlogUrl
//
//  Created by Kiran Soumya on 12/13/12.
//  Copyright 2012 Cognizant. All rights reserved.
//
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kOpenTokURL [NSURL URLWithString:@"http://localhost:3000/chat/index.json"] //2

#import "iCodeBlogUrlViewController.h"

@implementation iCodeBlogUrlViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:kOpenTokURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSHashTable* connectionDetails = [json objectForKey:@"connection"]; //2
    NSArray* session = [json objectForKey:@"session"];
    
    NSLog(@"opentok connection: %@", connectionDetails); //3
    
    // 1) Get the latest loan
    // NSHashTable* opentok = [connectionDetails valueForKey:@"api_url"];
    
    // 2) Get the funded amount and loan amount
    // NSNumber* fundedAmount = [loan objectForKey:@"funded_amount"];
    // NSNumber* loanAmount = [loan objectForKey:@"loan_amount"];
    // float outstandingAmount = [loanAmount floatValue] -
    // [fundedAmount floatValue];
    
    // 3) Set the label appropriately
    humanReadble.text = [NSString stringWithFormat:@"OpenTok Details : %@ from %@ ",session, [connectionDetails valueForKey:@"api_url"]];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
