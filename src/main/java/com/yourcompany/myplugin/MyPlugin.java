package com.yourcompany.myplugin;

import com.intellij.openapi.components.ApplicationComponent;
import org.cef.CefApp;
import org.cef.CefClient;
import org.cef.browser.CefBrowser;
import org.cef.browser.CefMessageRouter;
import org.cef.callback.CefQueryCallback;
import org.cef.handler.CefMessageRouterHandlerAdapter;
import org.cef.browser.CefFrame;
import org.jetbrains.annotations.NotNull;

public class MyPlugin implements ApplicationComponent {

    private CefApp cefApp;
    private CefClient client;
    private CefBrowser browser;
    private CefMessageRouter messageRouter;

    @Override
    public void initComponent() {
        cefApp = CefApp.getInstance();
        client = cefApp.createClient();
        String url = getClass().getResource("/ui/dist/ui/index.html").toString();
        browser = client.createBrowser(url, false, false);

        messageRouter = CefMessageRouter.create();
        messageRouter.addHandler(new CefMessageRouterHandlerAdapter() {
            @Override
            public boolean onQuery(CefBrowser browser, CefFrame frame, long query_id, String request, boolean persistent, CefQueryCallback callback) {
                if (request.equals("ping")) {
                    callback.success("pong");
                    return true;
                }
                return false;
            }
        }, true);

        client.addMessageRouter(messageRouter);
    }

    @Override
    public void disposeComponent() {
        cefApp.dispose();
    }

    @NotNull
    @Override
    public String getComponentName() {
        return "MyPlugin";
    }
}