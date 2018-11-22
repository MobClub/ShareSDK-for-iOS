;(function() {
    var messagingIframe,
        bridge = 'JSKitOnClient',
        CUSTOM_PROTOCOL_SCHEME = 'jscall';
  
    if (window[bridge]) { return }

	function _createQueueReadyIframe(doc) {
        messagingIframe = doc.createElement('iframe');
		messagingIframe.style.display = 'none';
		doc.documentElement.appendChild(messagingIframe);
	}
	window[bridge] = {};
    var methods = [%@];
    for (var i=0;i<methods.length;i++){
        var method = methods[i];
        var code = "(window[bridge])[method] = function " + method + "() {messagingIframe.src = CUSTOM_PROTOCOL_SCHEME + ':' + arguments.callee.name + ':' + encodeURIComponent(JSON.stringify(arguments));}";
        eval(code);
    }
  
    //创建iframe，必须在创建external之后，否则会出现死循环
    _createQueueReadyIframe(document);
    //通知js开始初始化
    //initReady();
})();

