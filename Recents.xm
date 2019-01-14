#import <Headers/Interfaces.h>

static UISegmentedControl* control;

%group Recents
%hook UISegmentedControl
-(void)didMoveToWindow
{
    %orig;
    control = self;
    if (self.selectedSegmentIndex == 3)
    {
        PackageListViewController* vc = (PackageListViewController*)[self _viewControllerForAncestor];
        //reload collectionview:
        UICollectionView* collectionView = MSHookIvar<UICollectionView*>(vc, "_collectionView");
        [collectionView reloadData];
    }
}

-(void)insertSegmentWithTitle:(id)arg1 atIndex:(unsigned long long)arg2 animated:(BOOL)arg3
{
    %orig;
    if (arg2 == 2)
    {
        //add segment
        [self insertSegmentWithTitle:@"Recents" atIndex:3 animated:NO];
    }
}
%end

%hook PackageListViewController
-(void)changeSettings:(UISegmentedControl*)control
{
    //reload collectionview:
    UICollectionView* collectionView = MSHookIvar<UICollectionView*>(self, "_collectionView");
    [collectionView performBatchUpdates:^{ %orig; } completion:nil];
    [collectionView reloadData];
}
%end

static NSDate* dateForPackage(Package* p)
{
    NSString* filePath = [NSString stringWithFormat:@"/var/lib/dpkg/info/%@.list", p.package];
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath])
    {
        NSError* error;
        NSDictionary* attr = [manager attributesOfItemAtPath:filePath error:&error];
        if (!error)
        {
            NSDate* d = attr[NSFileModificationDate];
            if (d) return d;
        }
    }
    return NSDate.distantFuture;
}

static void sortPackages(NSArray* __strong& packages)
{
    packages = [packages sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate* first = dateForPackage(a);
        NSDate* second = dateForPackage(b);
        return [second compare:first];
    }];
}

%hook UICollectionView
-(void)reloadData
{
    PackageListViewController* vc = (PackageListViewController*)[self _viewControllerForAncestor];
    if ([vc isKindOfClass:%c(PackageListViewController)])
    {
        NSInteger index = control.selectedSegmentIndex;
        if (index == 3)
        {
            //recents tab selected
            //get packages array:
            NSArray* __strong& packages = MSHookIvar<NSArray*>(vc, "_packages");
            sortPackages(packages);
            %orig;
        }
    }
    %orig;
}
%end
%end

%ctor {
	if ([prefs boolForKey:@"recentsEnabled"]) {
        %init(Recents);
    }
}
