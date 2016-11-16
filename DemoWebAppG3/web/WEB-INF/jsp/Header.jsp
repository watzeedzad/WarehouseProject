<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<c:set var="loginOrLogout" value="${sessionScope.user == null ? 'Login' : 'Logout'}"/>

<table style="background-color: lightgray">
    <tr>
        <td style="width: 3%"></td>
        <td style="width: 10%"> <a href="index.jsp"><img src="logo.png" width="120px"></a> </td>
        <td style="width: 1%"></td>
        <td style="width: 70%; font-size: 70px; color: black; ">${param.title}</td>
        <td style="width: 10%; text-align: center"> 
            <c:if test="${CART != null}">
                <a href="ViewCart.jsp" title="View/Update Your Cart">
                    <img src="images/cart.png" width="50px"><br>
                    (${CART.size})
                </a>
            </c:if>
        </td>
        <td style="width: 10%"> 
            <a href="${loginorLogout}" title="${loginorLogout}"></a><br>
            <img src="user.png" width="80px">
            Hello<c:out value="${user.name}" default="Guest"/>
        </td>
    </tr>
</table>