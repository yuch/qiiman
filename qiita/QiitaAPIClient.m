
#import "QiitaAPIClient.h"

#import "AFJSONRequestOperation.h"

static NSString * const kQiitaAPIBaseURLString = @"https://qiita.com/api/v1/";

@implementation QiitaAPIClient

+ (QiitaAPIClient *)sharedClient {
    static QiitaAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[QiitaAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kQiitaAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
