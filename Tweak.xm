@import Foundation;
#import <substrate.h>
//A new method from iOS 14
// Tried on iOS 15 by Cronocideios

int returnOne() {
    NSLog(@"CCPatch15 Cancelled signature verification call");
    return 1;
}

%ctor {
    NSLog(@"CCPatch15 Starting Hooks");
    NSArray *symbols = @[
        @"_SecKeyRawVerify",
        @"__Z28VerifyCarrierBundleSignatureRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE15CBSignatureType16SignatureKeyType",
	@"__Z32VerifyCarrierBundleSignature_OSXRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE16SignatureKeyTypeNS_6vectorI15CBSignatureTypeNS3_ISA_EEEE",
	@"__Z35VerifyCarrierBundleSignatureForTypeRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE15CBSignatureType",
	@"__Z37VerifyCarrierBundleVersionsXMLFormat1PK14__CFDictionary15CBSignatureType16SignatureKeyType",
	@"__Z37VerifyCarrierBundleVersionsXMLFormat2PK14__CFDictionary15CBSignatureType16SignatureKeyType",
	@"__Z39VerifyCarrierBundleVersionsXMLSignaturePK14__CFDictionary16CBVersionsFormat15CBSignatureType",
	@"__Z50VerifyCarrierBundleVersionsXMLSignatureWithKeyTypePK14__CFDictionary16CBVersionsFormat15CBSignatureType16SignatureKeyType"
    ];
    for (NSString *symbol in symbols) {
        MSHookFunction(MSFindSymbol(NULL, symbol.UTF8String), (void *)returnOne, NULL);
    }
}
