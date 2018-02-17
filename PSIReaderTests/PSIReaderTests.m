//
//  PSIReaderTests.m
//  PSIReaderTests
//
//  Created by AyeChan PyaeSone on 15/2/18.
//  Copyright © 2018 acps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HomeVC.h"
#import "KeyChainWrapper.h"
#import "FWEncryptorAES.h"

@interface PSIReaderTests : XCTestCase
@property (nonatomic) HomeVC *homeVC;
@property (nonatomic) PSIDataReader *psiDataReader;
@end

@implementation PSIReaderTests

- (void)setUp {
    [super setUp];
    self.psiDataReader = [[PSIDataReader alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLoadFromAPI {
    
    [self.psiDataReader loadDataWithSuccess:^(NSDictionary *dict) {
        XCTAssertTrue(dict.count > 1);
    } networkError:^(NSError *exception) {
         XCTFail(@"NETWORK ERROR");
    }];
   
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void) testGenerateRandomKey{
    [self.psiDataReader generateRandomKeys];
    KeyChainWrapper *keychain = [[KeyChainWrapper alloc] init];
    NSData *keyData = [keychain fetchWithService:@"PSIReaderKey" andAccount:@"PSIReaderKey"];
    NSData *iVData = [keychain fetchWithService:@"PSIReaderIV" andAccount:@"PSIReaderIV"];
    XCTAssertNotNil(keyData);
    XCTAssertNotNil(iVData);
}

- (void) testSaveAPITokenWithRandomKeyswithToken{
    NSString *apiKey = @"df4a51d1-7235-4e91-ad69-873ee3743680";
    
    [self.psiDataReader generateRandomKeys];
    [self.psiDataReader saveAPITokenWithRandomKeyswithToken:apiKey];
    
    KeyChainWrapper *keychain = [[KeyChainWrapper alloc] init];
    NSData *keyData = [keychain fetchWithService:@"PSIReaderKey" andAccount:@"PSIReaderKey"];
    NSData *iVData = [keychain fetchWithService:@"PSIReaderIV" andAccount:@"PSIReaderIV"];
    NSData *tokenData = [keychain fetchWithService:@"PSIReaderToken" andAccount:@"PSIReaderToken"];
    
    NSString *key = [[NSString alloc] initWithData:keyData encoding:NSUTF8StringEncoding];
    NSString *iV = [[NSString alloc] initWithData:iVData encoding:NSUTF8StringEncoding];
    
    NSData *decrypteddataaftersavingKeychain = [FWEncryptorAES decrypt:tokenData Key:key IV:iV];
    NSString *token =  [[NSString alloc] initWithData:decrypteddataaftersavingKeychain encoding:NSUTF8StringEncoding];
    NSLog(@"Token %@", token);
    XCTAssertNotNil(token);
    XCTAssertEqualObjects(token, apiKey);
}
@end
