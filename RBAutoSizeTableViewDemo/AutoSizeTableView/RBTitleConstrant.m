//
//  RBTitleConstrant.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBTitleConstrant.h"

@implementation RBTitleConstrant
NSString const* RBTitle = @" Mr. Simms doesn’t want it. He doesn’t need to be labeled, still worthy of being a Baird man! What the hell is that? What is your motto here? Boys, inform on your classmates, save your hide, anything short of that, we’re gonna burn you at the stake? Well, gentleman, when the shit hits the fan some guys run and some guys stay, here’s Charlie, facin’ the fire and there’s George hidin’ in big daddy’s pocket. And what are you doing? And you are gonna reward George, and destroy Charlie.No, I’m just gettin’ warmed up! I don’t know who went to this place, William Howard Taft, William Jennings Bryant, William Tell, whoever, their spirit is dead, if they ever had one. It’s gone. You’re buildin’ a rat ship here, a vessel for seagoin’ snitches. And if you think you’re preparin’ these minnows for manhood, you better think again, because I say you’re killin’ the very spirit this institution proclaims it instills. What a sham! What kind of a show are you guys puttin’ on here today? I mean, the only class in this act is sittin’ next to me, I’m here to tell you this boy’s soul is intact, it’s non-negotiable, you know how I know, someone here, and I’m not gonna say who, offered to buy it, only Charlie here wasn’t sellin’.I’ll show you out of order. You don’t know what out of order is, Mr. Trask, I’d show you, but I’m too old, I’m too tired, I’m too fuckin’ blind, if I were the man I was five years ago, I’d take a flame thrower to this place! Out of order? Who the hell do you think you’re talkin’ to? I’ve been around, you know? There was a time I could see, and I have seen, boys like these, younger than these, their arms torn out, their legs ripped off, but there is nothin’ like the sight of an amputated spirit. There is no prosthetic for that, you think you’re merely sendin’ this splendid foot solider back home to Oregen with his tail between his legs, but I say you’re executin’ his soul! And why? because he is not a Baird man. Baird men, you hurt this boy, you’re gonna be Baird bums, the lot of you. And Harry, Jimmy, and Trent, wherever you are out there, fuck you too!I’m not finished. As I came in here, I heard those words: cradle of leadership. Well, when the bough breaks, the cradle will fall, and it has fallen here, it has fallen. Makers of men, creators of leaders, be careful what kind of leaders you’re producin’ here. I don’t know if Charlie’s silence here today is right or wrong, I’m not a judge or jury, but I can tell you this: he won’t sell anybody out to buy his future! And that my friends is called integrity, that’s called courage. Now, that’s the stuff leaders should be made of. Now I have come to crossroads in my life, I always knew what the right path was. Without exception, I knew, but I never took it, you know why, it was too damn hard. Now here’s Charlie, he’s come to the crossroads, he has chosen a path. It’s the right path, it’s a path made of principle that leads to character. Let him continue on his journey. You hold this boy’s future in your hands, committee, it’s a valuable future, believe me. Don’t destroy it, protect it. Embrace it. It’s gonna make you proud one day, I promise you. How’s that for cornball?";

+ (NSArray *)getTitleUnitList{
    
    NSUInteger length = [RBTitle length];
    NSArray *titleUnitList = [[NSArray alloc] initWithObjects:[RBTitle substringToIndex:length/4], [RBTitle substringToIndex:length/3], [RBTitle substringToIndex:length/2], [RBTitle substringToIndex:length], nil];
    return titleUnitList;
}

@end
