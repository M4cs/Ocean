#import <Headers/Interfaces.h>

static void sortRepos(NSMutableArray<Repo*>* __strong& repos)
{
    repos = [[repos sortedArrayUsingComparator:^NSComparisonResult(Repo* a, Repo* b) {
        NSString* first = a.repoName;
        NSString* second = b.repoName;
        return [[first lowercaseString] compare:[second lowercaseString]];
    }] mutableCopy];
}

%group SortRepos
%hook Repo
-(void)setRepoName:(id)arg2
{
    %orig;
    NSMutableArray<Repo*>* __strong& repos = MSHookIvar<NSMutableArray<Repo*>*>([%c(RepoManager) sharedInstance], "_repoList");
    sortRepos(repos);
}
%end
%end

%ctor {
    if ([prefs boolForKey:@"sortRepos"]) {
        %init(SortRepos);
    }
}
