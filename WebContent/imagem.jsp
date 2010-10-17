<%
	byte[] b = (byte[])session.getAttribute("imagem");
	response.setContentType("image/x-ms-bmp");
	response.setContentLength(b.length);
	response.getOutputStream().write(b);
	session.removeAttribute("image");
%>