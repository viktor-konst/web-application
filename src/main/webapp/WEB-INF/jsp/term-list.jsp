<%--
  Created by IntelliJ IDEA.
  User: vikto
  Date: 10.03.2021
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false" %>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="../../resources/css/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>My Study</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-1">

        </div>
        <div class="col">

            <div class="main_title">

                <h1>Система управления студентами и их успеваемостью</h1>
            </div>
        </div>
        <div class="col-sm-1">
            <c:choose>
                <c:when test="${role eq 'guest' }">
                    <div class="loggout_button">
                        <a class="sml_btn" href="/logout">Login</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="loggout_button">
                        <a class="sml_btn" href="/logout">Logout</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<div class="info">
    <div class="container">

        <div class="row">
            <div class="col-sm-1">
                <a href="/home">На&nbsp;главную</a>
            </div>
            <div class="col-sm-4">

            </div>

        </div>
    </div>
    <form>
        <div class="container">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col">
                    <div class="row  mb-3">

                        <label for="colFormLabelLg" class="col-sm-3 col-form-label ">
                            <h4 class="term_choise">Выбрать семестр:</h4>
                        </label>

                        <div class="col-sm-3">
                            <select name="termID" class="form-select" aria-label="Выберите семестр">


                                <c:forEach items="${terms}" var="trm">
                                    <c:choose>
                                        <c:when test="${defaultTerm.id==trm.id}">
                                            <option value="${trm.id}" selected>${trm.termName}</option>
                                        </c:when>

                                        <c:otherwise>
                                            <option value="${trm.id}">${trm.termName}</option>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>

                            </select>
                        </div>
                        <div class="col-sm-2">
                            <input formmethod="post" type="submit" class="students_btn2 form-control "
                                   id="colFormLabelLg"
                                   value="Выбрать">
                        </div>

                    </div>

                </div>
                <div class="col-sm-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col "><h4 class="term_choise">Длительность семестра: <c:choose>
                    <c:when test="${defaultTerm==null}">
                        <c:out value="${terms.get(0).duration}"></c:out>
                    </c:when>

                    <c:otherwise>
                        <c:out value="${defaultTerm.duration}"></c:out>
                    </c:otherwise>
                </c:choose></h4>
                    <h4 class="term_choise">Список дисциплин семестра </h4></div>
                <div class="col-sm-1"></div>
            </div>
            <div class="row ">
                <div class="col-sm-1"></div>
                <div class="col-sm-4">

                    <table>
                        <tr class="first_row">

                            <th>Наименование дисциплины</th>
                        </tr>
                        <c:forEach items="${lessons}" var="ls">
                            <tr>

                                <td>${ls.lessonName}</td>

                            </tr>
                        </c:forEach>
                    </table>

                </div>
                <div class="col-sm-4">
                    <div class="input_form">
                        <c:choose>
                            <c:when test="${role eq 'администратор'}">
                                <input formmethod="get" formaction="/term-list/new-term" type="submit"
                                       class="students_btn1" value="Создать семестр">

                                <input formaction="/term-list/modify-term" formmethod="post" type="submit"
                                       class="students_btn1" value="Модифицировать выбранный семестр">


                                <input formaction="/term-list/deactivate_term" formmethod="post" type="submit"
                                       class="students_btn1" value="Удалить выбранный семестр">
                            </c:when>
                        </c:choose>


                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


</body>

</html>