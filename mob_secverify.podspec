Pod::Spec.new do |s|
	s.name                = "mob_secverify"
	s.version             = "3.1.2"
	s.summary             = '秒验，一键登录'
	s.license             = 'Copyright © 2019-2029 mob.com'
	s.author              = { "mob" => "mobproducts@163.com" }
	s.homepage            = 'http://www.mob.com'
	s.source              = { :http => 'https://dev.ios.mob.com/files/download/secverify/SecVerify_For_iOS_v3.1.2.zip' }
	s.platform            = :ios, '8.0'
	s.libraries           = "c++"
	s.vendored_frameworks = 'SecVerify/SecVerify.framework', 'SecVerify/PlatformSDK/Mobile/TYRZUISDK.framework', 'SecVerify/PlatformSDK/Telecom/EAccountHYSDK.framework', 'SecVerify/PlatformSDK/Union/OAuth.framework'
	s.resources 		  = 'SecVerify/SecVerify.bundle', 'SecVerify/PlatformSDK/Telecom/EAccountOpenPageResource.bundle'
	s.xcconfig  		  =  {'OTHER_LDFLAGS' => '-ObjC' }
	s.dependency 'MOBFoundation'
end
