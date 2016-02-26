//
//  TimelineEventsListItem.m
//  TogglDesktop
//
//  Created by Indrek Vändrik on 05/02/16.
//  Copyright © 2016 Alari. All rights reserved.
//

#import "TimelineEventsListItem.h"
#import "TimelineEventView.h"

@implementation TimelineEventsListItem

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];

	// Drawing code here.
}

- (void)render:(TimelineChunkView *)view_item
{
	NSAssert([NSThread isMainThread], @"Rendering stuff should happen on main thread");

	NSMutableAttributedString *events = [[NSMutableAttributedString alloc] initWithString:@""];

	self.timeLabel.stringValue = view_item.StartTimeString;
	for (TimelineEventView *event in view_item.Events)
	{
		[events appendAttributedString:[event descriptionString]];
	}
	[[self.appTitlesTextView textStorage] setAttributedString:events];

	[self.appsBox setHidden:[events length] == 0];
	self.Started = view_item.Started;
}

- (void)setSelected:(BOOL)endTime
{
	if (endTime)
	{
		self.selectedLabel.stringValue = @"End time";
	}
	else
	{
		self.selectedLabel.stringValue = @"Start time";
	}
	[self.selectedLabel setHidden:NO];
}

- (void)setUnSelected
{
	[self.selectedLabel setHidden:YES];
}

@end