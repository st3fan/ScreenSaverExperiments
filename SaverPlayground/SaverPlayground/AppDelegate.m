// AppDelegate.m

@import SpriteKit;

#import "AppDelegate.h"

@interface MyScene : SKScene
@end

@implementation MyScene
- (void)sceneDidLoad {
    [super sceneDidLoad];
}

-(void)didMoveToView:(SKView *)view {
    [super didMoveToView: view];
}
@end

#pragma mark -

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property SKView *sceneView;
@property SKScene *scene;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void) awakeFromNib {
    NSLog(@"%@", self.window);

    self.sceneView = [[SKView alloc] initWithFrame: NSMakeRect(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    self.sceneView.showsFPS = YES;
    self.sceneView.showsNodeCount = YES;
    self.sceneView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self.window.contentView addSubview: self.sceneView];
    
    self.scene = [[MyScene alloc] initWithSize: self.sceneView.frame.size];
    [self.sceneView presentScene: self.scene];
}

@end
