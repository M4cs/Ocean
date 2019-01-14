/*
 *       TranslateString
 *
 *       Translate any NSString to the native User language
 *
 *       by julioverne
 *
 *       Exemple:
 *                  NSString* translated = [@"Amando object c" googleTranslate];
 *
 */
 
 static __strong UIWebView *webViewGoogleTL;

@implementation NSString (TranslateString)
-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding
{
	static __strong NSString* kCodes = @"!*'\"();:@&=+$,/?%#[] ";
	return (__bridge NSString*)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef)kCodes, CFStringConvertNSStringEncodingToEncoding(encoding));
}
- (NSString*)googleTranslate
{
	__block BOOL waitForME;
	waitForME = NO;
	if(!webViewGoogleTL) {
		waitForME = YES;
		dispatch_async(dispatch_get_main_queue(), ^{
			webViewGoogleTL = [[UIWebView alloc]initWithFrame:CGRectZero];
			[webViewGoogleTL loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"data:text/html;base64,PCFET0NUWVBFIGh0bWw+DQo8aHRtbD48c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCI+DQp2YXIgVEtLID0gKChmdW5jdGlvbigpIHsNCiAgdmFyIGEgPSA1NjE2NjYyNjg7DQogIHZhciBiID0gMTUyNjI3MjMwNjsNCiAgcmV0dXJuIDQwNjM5OCArICcuJyArIChhICsgYik7DQp9KSgpKTsNCmZ1bmN0aW9uIGIoYSwgYikgew0KICBmb3IgKHZhciBkID0gMDsgZCA8IGIubGVuZ3RoIC0gMjsgZCArPSAzKSB7DQogICAgICB2YXIgYyA9IGIuY2hhckF0KGQgKyAyKSwNCiAgICAgICAgICBjID0gImEiIDw9IGMgPyBjLmNoYXJDb2RlQXQoMCkgLSA4NyA6IE51bWJlcihjKSwNCiAgICAgICAgICBjID0gIisiID09IGIuY2hhckF0KGQgKyAxKSA/IGEgPj4+IGMgOiBhIDw8IGM7DQogICAgICBhID0gIisiID09IGIuY2hhckF0KGQpID8gYSArIGMgJiA0Mjk0OTY3Mjk1IDogYSBeIGMNCiAgfQ0KICByZXR1cm4gYTsNCn0NCmZ1bmN0aW9uIHRrKGEpIHsNCiAgICBmb3IgKHZhciBlID0gVEtLLnNwbGl0KCIuIiksIGggPSBOdW1iZXIoZVswXSkgfHwgMCwgZyA9IFtdLCBkID0gMCwgZiA9IDA7IGYgPCBhLmxlbmd0aDsgZisrKSB7DQogICAgICAgIHZhciBjID0gYS5jaGFyQ29kZUF0KGYpOw0KICAgICAgICAxMjggPiBjID8gZ1tkKytdID0gYyA6ICgyMDQ4ID4gYyA/IGdbZCsrXSA9IGMgPj4gNiB8IDE5MiA6ICg1NTI5NiA9PSAoYyAmIDY0NTEyKSAmJiBmICsgMSA8IGEubGVuZ3RoICYmIDU2MzIwID09IChhLmNoYXJDb2RlQXQoZiArIDEpICYgNjQ1MTIpID8gKGMgPSA2NTUzNiArICgoYyAmIDEwMjMpIDw8IDEwKSArIChhLmNoYXJDb2RlQXQoKytmKSAmIDEwMjMpLCBnW2QrK10gPSBjID4+IDE4IHwgMjQwLCBnW2QrK10gPSBjID4+IDEyICYgNjMgfCAxMjgpIDogZ1tkKytdID0gYyA+PiAxMiB8IDIyNCwgZ1tkKytdID0gYyA+PiA2ICYgNjMgfCAxMjgpLCBnW2QrK10gPSBjICYgNjMgfCAxMjgpDQogICAgfQ0KICAgIGEgPSBoOw0KICAgIGZvciAoZCA9IDA7IGQgPCBnLmxlbmd0aDsgZCsrKSBhICs9IGdbZF0sIGEgPSBiKGEsICIrLWFeKzYiKTsNCiAgICBhID0gYihhLCAiKy0zXitiKy1mIik7DQogICAgYSBePSBOdW1iZXIoZVsxXSkgfHwgMDsNCiAgICAwID4gYSAmJiAoYSA9IChhICYgMjE0NzQ4MzY0NykgKyAyMTQ3NDgzNjQ4KTsNCiAgICBhICU9IDFFNjsNCiAgICByZXR1cm4gYS50b1N0cmluZygpICsgIi4iICsgKGEgXiBoKTsNCn0NCjwvc2NyaXB0Pjxib2R5PjwvYm9keT48L2h0bWw+DQo="]]];
			waitForME = NO;
		});
		while(waitForME) {
			sleep(1/4);
		}
		sleep(2);
		waitForME = YES;
		dispatch_async(dispatch_get_main_queue(), ^{
			[webViewGoogleTL stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"tk(\"%@\");", @" "]];
			waitForME = NO;
		});
		while(waitForME) {
			sleep(1/4);
		}
	}
	NSString* translatedText = nil;
	static __strong NSString* kUrlF = @"https://translate.google.com/translate_a/t?client=webapp&ie=UTF-8&oe=UTF-8&sl=auto&tl=%@&tk=%@&q=%@";
	@autoreleasepool {
		__block NSString *tokenQuerySt = nil;
		tokenQuerySt = nil;
		
		waitForME = YES;
		dispatch_async(dispatch_get_main_queue(), ^{
			tokenQuerySt = [webViewGoogleTL stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"tk(\"%@\");", [self stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]]];
			waitForME = NO;
		});
		while(waitForME) {
			sleep(1/4);
		}
		NSString* urlGet = [NSString stringWithFormat:kUrlF, CFLocaleGetIdentifier(CFLocaleCopyCurrent()), tokenQuerySt, [self urlEncodeUsingEncoding:NSUTF8StringEncoding]];
		NSURLResponse* imageresponse_link = nil;
		NSError* error = nil;
		NSData *data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlGet] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10] returningResponse:&imageresponse_link error:&error];
		NSHTTPURLResponse *httpResponse_link = (NSHTTPURLResponse*)imageresponse_link;
		if(!error&&httpResponse_link.statusCode == 200) {
			id response = [NSJSONSerialization JSONObjectWithData:data?:[NSData data] options:0 error:&error];
			if(!error && response) {
				if([response isKindOfClass:[NSArray class]]) {
					NSString* trl = response[0];
					if(trl) {
						translatedText = [translatedText?:@"" stringByAppendingString:trl];
					}
				}
			}
		} else if(/*error||*/httpResponse_link.statusCode != 200) {
			if(httpResponse_link.statusCode > 500) {
				return nil;
			}
		}
	}
	return translatedText;
}
@end
