<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>

<t:main_layout title="Pagination">

    <div class="paginate paginate-dark wrapper">

        <div class="text-center">
            <form action="<c:url value="/pagination"/>" method="get">
                <div id="inquiry">
                    <input type="text" class="form-control" name="searchTerm" id="searchTerm"
                           placeholder="Title">
                    <button type="submit" class="btn btn-success">Search</button>
                </div>
            </form>
        </div>

        <ul>
            <div id="page" class="container">
                <div id="content">
                    <div class="title">
                        <h2>Here you will see ur playlist</h2>
                        <span class="byline">And you will be able to add any link from soundcloud to listen to it here</span>
                    </div>

                    <div class="pagination">
                        <ul>
                            <c:choose>
                                <c:when test="${currentIndex == 1}">
                                    <li class="disabled"><a href="#">&lt;&lt;</a></li>
                                    <li class="disabled"><a href="#">&lt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${firstUrl}">&lt;&lt;</a></li>
                                    <li><a href="${prevUrl}">&lt;</a></li>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
                                <c:url var="pageUrl" value="/links/pages/${i}"/>
                                <c:choose>
                                    <c:when test="${i == currentIndex}">
                                        <li class="active"><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${currentIndex == deploymentLog.totalPages}">
                                    <li class="disabled"><a href="#">&gt;</a></li>
                                    <li class="disabled"><a href="#">&gt;&gt;</a></li>

                                </c:when>
                                <c:otherwise>
                                    <li><a href="${nextUrl}">&gt;</a></li>
                                    <li><a href="${lastUrl}">&gt;&gt;</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <br>

                    <c:forEach var="link" items="${page.getContent()}" varStatus="loop">
                        ${link.getTitle()}
                        <br>
                        <div id="haha${ loop.index}"></div>

                        <script>
                            var track_url = '${link.getLink()}';
                            SC.oEmbed(track_url, { iframe: true }).then(function(oEmbed) {
                                document.getElementById("haha${loop.index}").innerHTML = oEmbed.html;
                            });
                        </script>
                        <br>
                    </c:forEach>

                    <br>

                    <div class="pagination">
                        <ul>
                            <c:choose>
                                <c:when test="${currentIndex == 1}">
                                    <li class="disabled"><a href="#">&lt;&lt;</a></li>
                                    <li class="disabled"><a href="#">&lt;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${firstUrl}">&lt;&lt;</a></li>
                                    <li><a href="${prevUrl}">&lt;</a></li>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
                                <c:url var="pageUrl" value="/links/pages/${i}"/>
                                <c:choose>
                                    <c:when test="${i == currentIndex}">
                                        <li class="active"><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${currentIndex == deploymentLog.totalPages}">
                                    <li class="disabled"><a href="#">&gt;</a></li>
                                    <li class="disabled"><a href="#">&gt;&gt;</a></li>

                                </c:when>
                                <c:otherwise>
                                    <li><a href="${nextUrl}">&gt;</a></li>
                                    <li><a href="${lastUrl}">&gt;&gt;</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>

                </div>
                <div id="sidebar">
                    <div class="box1">
                        <div class="title">
                            <h2>Mauris vulputate</h2>
                        </div>
                        <ul class="style1">
                            <tr>
                                <td>Semper mod quis eget mi dolore</td>
                                <td>Quam turpis feugiat sit dolor</td>
                                <td>Amet ornare in hendrerit in lectus</td>
                                <td>Consequat etiam lorem phasellus</td>
                                <td><a href="#">Amet turpis, feugiat et sit amet</a></td>
                            </tr>
                        </ul>
                    </div>
                    <div class="box2">
                        <div class="title">
                            <h2>Integer gravida</h2>
                        </div>
                        <ul class="style1">
                            <tr>
                                <td>Amet turpis, feugiat et sit amet</td>
                                <td>Ornare in hendrerit in lectus</td>
                                <td>Semper mod quis eget mi dolore</td>
                                <ts>Quam turpis feugiat sit dolor</ts>
                                <td>Amet ornare in hendrerit in lectus</td>
                                <td>Consequat etiam lorem phasellus</td>
                            </tr>
                        </ul>
                    </div>
                </div>
            </div>
        </ul>
    </div>

</t:main_layout>