package support;

import jakarta.servlet.*;
import jakarta.servlet.descriptor.JspConfigDescriptor;
import java.io.*;
import java.net.URL;
import java.util.*;

public abstract class FakeServletContext implements ServletContext {
	private final File root;
	private String requestCharacterEncoding;
	private String responseCharacterEncoding;
	public FakeServletContext(File root) { this.root = root; }

	@Override public String getRealPath(String path) {
		File f = new File(root, path.startsWith("/") ? path.substring(1) : path);
		return f.getAbsolutePath();
	}

	// Minimal stubs for compilation only
	@Override public String getContextPath() { return "/"; }
	@Override public ServletContext getContext(String uripath) { return this; }
	@Override public int getMajorVersion() { return 6; }
	@Override public int getMinorVersion() { return 0; }
	@Override public int getEffectiveMajorVersion() { return 6; }
	@Override public int getEffectiveMinorVersion() { return 0; }
	@Override public String getMimeType(String file) { return null; }
	@Override public Set<String> getResourcePaths(String path) { return null; }
	@Override public URL getResource(String path) { return null; }
	@Override public InputStream getResourceAsStream(String path) { return null; }
	@Override public RequestDispatcher getRequestDispatcher(String path) { return null; }
	@Override public RequestDispatcher getNamedDispatcher(String name) { return null; }
	public Servlet getServlet(String name) { return null; }
	public Enumeration<Servlet> getServlets() { return Collections.emptyEnumeration(); }
	public Enumeration<String> getServletNames() { return Collections.emptyEnumeration(); }
	@Override public void log(String msg) { System.out.println(msg); }
	public void log(Exception exception, String msg) { System.out.println(msg); exception.printStackTrace(); }
	@Override public void log(String message, Throwable throwable) { System.out.println(message); throwable.printStackTrace(); }
	@Override public String getServerInfo() { return "Fake"; }
	@Override public String getRequestCharacterEncoding() { return requestCharacterEncoding; }
	@Override public void setRequestCharacterEncoding(String encoding) { this.requestCharacterEncoding = encoding; }
	@Override public String getResponseCharacterEncoding() { return responseCharacterEncoding; }
	@Override public void setResponseCharacterEncoding(String encoding) { this.responseCharacterEncoding = encoding; }
	@Override public String getInitParameter(String name) { return null; }
	@Override public Enumeration<String> getInitParameterNames() { return Collections.emptyEnumeration(); }
	@Override public boolean setInitParameter(String name, String value) { return false; }
	@Override public Object getAttribute(String name) { return null; }
	@Override public Enumeration<String> getAttributeNames() { return Collections.emptyEnumeration(); }
	@Override public void setAttribute(String name, Object object) {}
	@Override public void removeAttribute(String name) {}
	@Override public String getServletContextName() { return "Fake"; }
	@Override public ServletRegistration.Dynamic addServlet(String servletName, String className) { return null; }
	@Override public ServletRegistration.Dynamic addServlet(String servletName, Servlet servlet) { return null; }
	@Override public ServletRegistration.Dynamic addServlet(String servletName, Class<? extends Servlet> servletClass) { return null; }
	@Override public <T extends Servlet> T createServlet(Class<T> c) { return null; }
	@Override public ServletRegistration getServletRegistration(String servletName) { return null; }
	@Override public Map<String, ? extends ServletRegistration> getServletRegistrations() { return Map.of(); }
	@Override public FilterRegistration.Dynamic addFilter(String filterName, String className) { return null; }
	@Override public FilterRegistration.Dynamic addFilter(String filterName, Filter filter) { return null; }
	@Override public FilterRegistration.Dynamic addFilter(String filterName, Class<? extends Filter> filterClass) { return null; }
	@Override public <T extends Filter> T createFilter(Class<T> c) { return null; }
	@Override public FilterRegistration getFilterRegistration(String filterName) { return null; }
	@Override public Map<String, ? extends FilterRegistration> getFilterRegistrations() { return Map.of(); }
	@Override public SessionCookieConfig getSessionCookieConfig() { return null; }
	@Override public void setSessionTrackingModes(Set<SessionTrackingMode> sessionTrackingModes) {}
	@Override public Set<SessionTrackingMode> getDefaultSessionTrackingModes() { return Set.of(); }
	@Override public Set<SessionTrackingMode> getEffectiveSessionTrackingModes() { return Set.of(); }
	@Override public void addListener(String className) {}
	@Override public <T extends EventListener> void addListener(T t) {}
	@Override public void addListener(Class<? extends EventListener> listenerClass) {}
	@Override public <T extends EventListener> T createListener(Class<T> c) { return null; }
	@Override public JspConfigDescriptor getJspConfigDescriptor() { return null; }
	@Override public ClassLoader getClassLoader() { return getClass().getClassLoader(); }
	@Override public void declareRoles(String... roleNames) {}
	@Override public String getVirtualServerName() { return "Fake"; }
}


