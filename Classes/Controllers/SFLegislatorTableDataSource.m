//
//  SFLegislatorTableDataSource.m
//  Congress
//
//  Created by Daniel Cloud on 11/25/13.
//  Copyright (c) 2013 Sunlight Foundation. All rights reserved.
//

#import "SFLegislatorTableDataSource.h"
#import "SFCellData.h"
#import "SFLegislator.h"

@implementation SFLegislatorTableDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath == nil) return nil;

    SFLegislator *legislator = (SFLegislator *)[self itemForIndexPath:indexPath];
    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:SFDefaultLegislatorCellTransformerName];
    SFCellData *cellData = [transformer transformedValue:legislator];

    SFTableCell *cell = (SFTableCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];

    [cell setCellData:cellData];
    if (cellData.persist && [cell respondsToSelector:@selector(setPersistStyle)]) {
        [cell performSelector:@selector(setPersistStyle)];
    }
    CGFloat cellHeight = [cellData heightForWidth:tableView.width];
    [cell setFrame:CGRectMake(0, 0, cell.width, cellHeight)];

    return cell;
}

@end