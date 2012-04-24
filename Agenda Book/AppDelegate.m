
#import "AppDelegate.h"
#import "Info.h"
#import "ClassesViewController.h"

@implementation AppDelegate {
    NSMutableArray *classes;
}

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *iCloudURL = [fileManager URLForUbiquityContainerIdentifier:@"DXD4278H9V.us.mbilker.agendabook"];
    NSLog(@"%@", [iCloudURL absoluteString]);
    
    if(iCloudURL) {
        NSUbiquitousKeyValueStore *iCloudStore = [NSUbiquitousKeyValueStore defaultStore];
        [iCloudStore setString:@"Success" forKey:@"iCloudStatus"];
        [iCloudStore synchronize]; // For Synchronizing with iCloud Server
        NSLog(@"iCloud status : %@", [iCloudStore stringForKey:@"iCloudStatus"]);
    }
    
    classes = [NSMutableArray arrayWithCapacity:20];
	UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
	ClassesViewController *classesViewController = [[navigationController viewControllers] objectAtIndex:0];
	classesViewController.classes = classes;
    return YES;
}

@end
