// AppDelegate.m

@import SpriteKit;

#import "AppDelegate.h"

@interface MyScene : SKScene
@property NSInteger logoIndex;
@end

@implementation MyScene
- (void)sceneDidLoad {
    [super sceneDidLoad];
}

-(void)didMoveToView:(SKView *)view {
    [super didMoveToView: view];

    SKSpriteNode *logo = [SKSpriteNode spriteNodeWithImageNamed: @"firefox-logo"];
    if (logo != nil) {
        [logo setScale: 0.25];
        logo.position = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
        [self addChild: logo];

        SKAction *rotateAction = [SKAction rotateByAngle: -1 duration: 1.0];
        [logo runAction: [SKAction repeatActionForever: rotateAction]];

        SKAction *scaleDownAction = [SKAction scaleTo: 0.0 duration: 2.0];
        scaleDownAction.timingMode = SKActionTimingEaseIn;

        SKAction *changeImageAction = [SKAction runBlock:^{
            switch (self.logoIndex) {
                case 0:
                    logo.texture = [SKTexture textureWithImageNamed: @"firefox-logo"];
                    break;
                case 1:
                    logo.texture = [SKTexture textureWithImageNamed: @"firefox-logo-nightly"];
                    break;
                case 2:
                    logo.texture = [SKTexture textureWithImageNamed: @"firefox-logo-developer-edition"];
                    break;
                case 3:
                    logo.texture = [SKTexture textureWithImageNamed: @"firefox-logo-focus"];
                    break;
            }
            self.logoIndex += 1;
            if (self.logoIndex == 4) {
                self.logoIndex = 0;
            }
        }];

        SKAction *scaleUpAction = [SKAction scaleTo: 0.25 duration: 2.0];
        scaleUpAction.timingMode = SKActionTimingEaseIn;

        [logo runAction: [SKAction repeatActionForever:
                          [SKAction sequence: @[scaleDownAction, changeImageAction, scaleUpAction]]]];
    }
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
