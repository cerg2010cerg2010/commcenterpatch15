#import <Foundation/Foundation.h>
#import <substrate.h>
#include <os/log.h>
// A new method from iOS 14
// Tried on iOS 15 by Cronocideios

static int returnOne() {
	os_log_info(OS_LOG_DEFAULT, "CCPatch15 Cancelled signature verification call");
	return 1;
}

%ctor {
	os_log_info(OS_LOG_DEFAULT, "CCPatch15 Starting Hooks");

	const char *symbols[] = {
		"_SecKeyRawVerify",
		"__Z28VerifyCarrierBundleSignatureRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE15CBSignatureType16SignatureKeyType",
		"__Z32VerifyCarrierBundleSignature_OSXRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE16SignatureKeyTypeNS_6vectorI15CBSignatureTypeNS3_ISA_EEEE",
		"__Z35VerifyCarrierBundleSignatureForTypeRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE15CBSignatureType",
		"__Z37VerifyCarrierBundleVersionsXMLFormat1PK14__CFDictionary15CBSignatureType16SignatureKeyType",
		"__Z37VerifyCarrierBundleVersionsXMLFormat2PK14__CFDictionary15CBSignatureType16SignatureKeyType",
		"__Z39VerifyCarrierBundleVersionsXMLSignaturePK14__CFDictionary16CBVersionsFormat15CBSignatureType",
		"__Z50VerifyCarrierBundleVersionsXMLSignatureWithKeyTypePK14__CFDictionary16CBVersionsFormat15CBSignatureType16SignatureKeyType"
	};
	for (int i = 0; i < sizeof(symbols)/sizeof(*symbols); ++i)
	{
		MSHookFunction(MSFindSymbol(NULL, symbols[i]), (void *)returnOne, NULL);
	}
}
