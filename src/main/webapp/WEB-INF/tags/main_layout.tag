<%@tag description="Default Layout Tag" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@attribute name="title" %>

<!DOCTYPE html>
<html>
<head>
    <script src="https://connect.soundcloud.com/sdk/sdk-3.0.0.js"></script>
    <script>
        SC.initialize({
            client_id: 'cf37b496d204e3e5e906f4f9b5e279cb'
        });
    </script>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>
        <c:if test="${not empty title}"> ${title}</c:if>
    </title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/default.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/fonts.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/brajeshwar-paginate-fe41ac2/paginate.css"/>">

</head>
<body>

<div id="header-wrapper">
    <div id="header" class="container">
        <div id="logo">
            <h1><a href="#">Daily Playlist</a></h1>
        </div>
        <div class="text-right">
            <a href='${s:mvcUrl("TC#change").arg(0, "ru_RU").build()}'>Рус</a>
            <a href='${s:mvcUrl("TC#change").arg(0, "en_US").build()}'>Eng</a>
        </div>
        <div id="menu">
            <ul>
                <li><a href="<c:url value="/login"/>" accesskey="1"><spring:message code="Log.in"/></a></li>
                <li><a href="<c:url value="/signup"/>" accesskey="2"><spring:message code="Sign.up"/></a></li>
                <li><a href="<c:url value="/pagination"/>" accesskey="3"><spring:message code="Playlists"/></a></li>
                <li><a href="<c:url value="/link"/>" accesskey="4"><spring:message code="New.link"/></a></li>
                <li><a href="<c:url value="/idea"/>" accesskey="5"><spring:message code="Home"/></a></li>
                <li><a href="<c:url value="/about"/>" accesskey="6"><spring:message code="About"/></a></li>
                <li><a href="<c:url value="/logout"/>" accesskey="7"><spring:message code="Log.out"/></a></li>
            </ul>
        </div>
    </div>
</div>
<div id="featured-wrapper">
    <div id="featured" class="container">
        <div class="box box1"><a href="#" class="image image-full"><img src="/resources/images/pic02.jpg"
                                                                        alt=""/></a>
        </div>
        <div class="box box2"><a href="#" class="image image-full"><img src="/resources/images/pic03.jpg"
                                                                        alt=""/></a>
        </div>
        <div class="box box3"><a href="#" class="image image-full"><img src="/resources/images/pic04.jpg"
                                                                        alt=""/></a>
        </div>
        <div class="box box4"><a href="#" class="image image-full"><img src="/resources/images/pic05.jpg"
                                                                        alt=""/></a>
        </div>
        <div class="box box5"><a href="#" class="image image-full"><img src="/resources/images/pic06.jpg"
                                                                        alt=""/></a>
        </div>
        <div class="box box6"><a href="#" class="image image-full"><img src="/resources/images/pic07.jpg"
                                                                        alt=""/></a>
        </div>
    </div>
</div>
<div class="page-wrapper">


    <div class="container">
        <jsp:doBody/>
    </div>

    <div id="footer-wrapper">
        <div id="footer" class="container">
            <div id="box1">
                <div class="title">
                    <h2>Latest Post</h2>
                </div>
                <ul class="style1">
                    <li><a href="#">Semper mod quis eget mi dolore</a></li>
                    <li><a href="#">Quam turpis feugiat sit dolor</a></li>
                    <li><a href="#">Amet ornare in hendrerit in lectus</a></li>
                    <li><a href="#">Consequat etiam lorem phasellus</a></li>
                    <li><a href="#">Amet turpis, feugiat et sit amet</a></li>
                    <li><a href="#">Semper mod quisturpis nisi</a></li>
                </ul>
            </div>
            <div id="box2">
                <div class="title">
                    <h2>Popular Links</h2>
                </div>
                <ul class="style1">
                    <li><a href="#">Semper mod quis eget mi dolore</a></li>
                    <li><a href="#">Quam turpis feugiat sit dolor</a></li>
                    <li><a href="#">Amet ornare in hendrerit in lectus</a></li>
                    <li><a href="#">Consequat etiam lorem phasellus</a></li>
                    <li><a href="#">Amet turpis, feugiat et sit amet</a></li>
                    <li><a href="#">Semper mod quisturpis nisi</a></li>
                </ul>
            </div>
            <div id="box3">
                <div class="title">
                    <h2>Follow Us</h2>
                </div>
                <ul class="contact">
                    <li><a href="https://twitter.com/Ceph_dnb" class="icon icon-twitter"><span>Twitter</span></a></li>
                    <li><a href="https://www.facebook.com/insizedub"
                           class="icon icon-facebook"><span>Facebook</span></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id="copyright" class="container">
    <p>&copy; Daily Playlist. All rights reserved. | Photos by <a href="https://soundcloud.com/cephdnb">Ceph</a> |
        Design by <a
                href="https://soundcloud.com/cephdnb" rel="nofollow">Ceph</a>.</p>
</div>
</body>
</html>