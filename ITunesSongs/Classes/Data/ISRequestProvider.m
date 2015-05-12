//
//  IARequestsManager.m
//  iTunesSongs
//
//  Created by Roman Salabay on 1/22/15.
//
//

#import "ISRequestProvider.h"

NSString * const BaseUrl = @"http://itunes.apple.com/search?term=";

@interface ISRequestProvider ()

@property (nonatomic, strong) NSOperationQueue          * operationQueue;
@property (nonatomic, strong) id <ISDataParserProtocol> parser;

@end

@implementation ISRequestProvider

- (instancetype)initWithDataParser:(id<ISDataParserProtocol>)parser
{

    if (self = [super init]) {

        _parser         = parser;
        _operationQueue = [NSOperationQueue new];
    }

    return self;
}

#pragma mark - ISDataParserProtocol methods

- (void)searchFor:(NSString *)pattern complition:(ISSearchResult)complition
{
    NSURLRequest * request = [self urlRequestFromSearchPattern:pattern];

    [self requestForUrl:request completionHandler:complition];
}

#pragma mark - Private methods

typedef void (^ISComplitionBlock)(NSDictionary *object, NSError *);

- (void)requestForUrl:(NSURLRequest *)request completionHandler:(ISComplitionBlock)completionBlock
{
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:self.operationQueue
                           completionHandler:^(NSURLResponse * response, NSData * data, NSError * connectionError) {
         if (data) {

             NSError * error;
             NSDictionary * dictionary = [self.parser parseData:data error:&error];

             (completionBlock != nil) ? completionBlock(dictionary, error) : nil;

         }
         else {

             completionBlock != nil ? completionBlock(nil, connectionError) : nil;
         }
     }];
}

- (NSURLRequest *)urlRequestFromSearchPattern:(NSString *)string
{
    return [NSURLRequest requestWithURL:[self urlForSearhPattern:string]];
}

- (NSURL *)urlForSearhPattern:(NSString *)patter
{
    NSString * sp = [NSString stringWithFormat:@"%@%@", BaseUrl, patter];
    return [NSURL URLWithString:sp];
}

@end
