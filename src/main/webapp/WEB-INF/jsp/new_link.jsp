<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:main_layout title="Плейлисты">


    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">
                    <strong> <spring:message code="New.link"/> </strong>
                </h2>
                <hr>

                <div class="text-center">
                    <c:if test="${not empty message}">
                        <h3>${message}</h3>
                    </c:if>
                </div>


                <form:form method="POST" commandName="link">
                    <br>
                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-4 text-center">
                            <form:label path="title"><spring:message code="Enter.playlist.title"/></form:label>
                            <form:input path="title"/>
                            <form:errors path="title"/><br>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-4 text-center">
                            <form:label path="link"><spring:message code="Enter.link"/></form:label>
                            <br>
                            <form:textarea path="link" rows="8" cols="40"/>
                            <form:errors path="link"/><br>
                        </div>
                    </div>
                    <div class="col-md-offset-4 col-md-4 text-center">
                        <button type="submit" class="btn btn-success"><spring:message code="Send"/></button>
                    </div>
                    <br>
                </form:form>
            </div>
        </div>
    </div>
</t:main_layout>


