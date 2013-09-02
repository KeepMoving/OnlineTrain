<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>课程在线学习测评系统</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">修改用户信息  &gt;&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top"> 
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="84%">&nbsp;    
			<H1>ACM国际大学生程序设计竞赛</H1>
					
			&nbsp;&nbsp;&nbsp;&nbsp;ACM国际大学生程序设计竞赛标志ACM国际大学生程序设计竞赛(英文全称:ACM International Collegiate 
			Programming Contest（<A href="http://baike.baidu.com/view/94267.htm" target=_blank>ACM-ICPC</A>
			或ICPC）是由美国计算机协会（ACM）主办的，一项旨在展示大学生创新能力、团队精神和在压力下编写程序、分析和解决问题能力的年度竞赛。经过近30多年的发展，ACM国际大学生程序设计竞赛已经发展成为最具影响力的大学生计算机竞赛。赛事目前由IBM公司赞助。
			<DIV class=bpctrl></DIV>
			<H2 class=first>
			<A 
			name=1></A>历史</H2>　　竞赛的历史可以上溯到1970年，当时在美国德克萨斯A&amp;M大学举办了首届比赛。当时的主办方是the Alpha 
			Chapter of the UPE Computer Science Honor 
			Society。作为一种全新的发现和培养计算机科学顶尖学生的方式，竞赛很快得到美国和加拿大各大学的积极响应。1977年，在ACM计算机科学会议期间举办了首次总决赛，并演变成为目前的一年一届的多国参与的国际性比赛。迄今已经举办了34届。 
			<BR>
			<DIV 
			class=spctrl></DIV>　　最初几届比赛的参赛队伍主要来自美国和加拿大，后来逐渐发展成为一项世界范围内的竞赛。特别是自1997年IBM开始赞助赛事之后，赛事规模增长迅速。1997年，总共有来自560所大学的840支队伍参加比赛。而到了2004年，这一数字迅速增加到840所大学的4109支队伍并以每年10-20%的速度在增长。 
			<BR>
		　　1980年代，ACM将竞赛的总部设在位于美国德克萨斯州的贝勒大学。 <BR>
			在赛事的早期，冠军多为美国和加拿大的大学获得。而进入1990年代后期以来， 
			俄罗斯和其它一些东欧国家的大学连夺数次冠军。来自中国大陆的<A href="http://baike.baidu.com/view/2784.htm" 
			target=_blank>上海交通大学</A>代表队则在2002年美国夏威夷的第26届和2005年上海的第29届全球总决赛上两夺冠军。这也是目前为止亚洲大学在该竞赛上取得的最好成绩。赛事的竞争格局已经由最初的北美大学一枝独秀演变成目前的亚欧对抗的局面。
			<DIV class=bpctrl></DIV>
			<H2>
			<A name=2></A>简要规则</H2>　　ACM-ICPC以团队的形式代表各学校参赛，每队由3名队员组成。每位队员必须是在校学生，有一定的年龄限制，并且最多可以参加2次全球总决赛和5次区域选拔赛。 
			<BR>
			<DIV 
			class=spctrl></DIV>　　比赛期间，每队使用1台电脑需要在5个小时内使用C、C++、Pascal或Java中的一种编写程序解决7到10个问题。程序完成之后提交裁判运行，运行的结果会判定为正确或错误两种并及时通知参赛队。而且有趣的是每队在正确完成一题后，组织者将在其位置上升起一只代表该题颜色的气球。 
			<BR>
			<DIV 
			class=spctrl></DIV>　　最后的获胜者为正确解答题目最多且总用时最少的队伍。每道试题用时将从竞赛开始到试题解答被判定为正确为止，其间每一次提交运行结果被判错误的话将被加罚20分钟时间，未正确解答的试题不记时。例如：A、B两队都正确完成两道题目，其中A队提交这两题的时间分别是比赛开始后1:00和2:45，B队为1:20和2:00，但B队有一题提交了2次。这样A队的总用时为1:00+2:45=3:45而B队为1:20+2:00+0:20=3:40，所以B队以总用时少而获胜。 
			<BR>
			<DIV 
			class=spctrl></DIV>　　与其它计算机程序竞赛（例如国际信息学奥林匹克，IOI）相比，ACM-ICPC的特点在于其题量大，每队需要5小时内完成8道题目，甚至更多。另外一支队伍3名队员却只有1台电脑，使得时间显得更为紧张。因此除了扎实的专业水平，良好的团队协作和心理素质同样是获胜的关键。
			<DIV class=bpctrl></DIV>
			<H2>
			<A 
			name=3></A>ACM竞赛规则：</H2>　　1.参赛队伍最多由三名参赛队员组成。<BR>
			<DIV class=spctrl></DIV>　　2.竞赛中至少命题6题，至多命题10题，试题描述为英文，比赛时间为5个小时。<BR>
			<DIV class=spctrl></DIV>　　3.竞赛可以使用的语言：C++、C、Java和Pascal。但final赛只有C/C++;<BR>
			<DIV class=spctrl></DIV>　　4.重点考察选手的算法和程序设计能力，不考察任何Windows编程知识；<BR>
			<DIV class=spctrl></DIV>　　5.选手可携带任何非电子类资料，包括书籍和打印出来的程序等；<BR>
			<DIV class=spctrl></DIV>　　6.评委负责将结果（正确或出错的类型）通过网络尽快返回给选手，除此之外不提供任何额外帮助；<BR>
			<DIV class=spctrl></DIV>　　返回结果：<BR>
			<DIV class=spctrl></DIV>　　1.Accepted. ---通过！(AC)<BR>
			<DIV class=spctrl></DIV>　　2.Wrong Anwser. ---答案错。(WA)<BR>
			<DIV class=spctrl></DIV>　　3.RunTime Error. ---程序运行出错，意外终止等。(RTE)<BR>
			<DIV class=spctrl></DIV>　　4.Time Limit Exceeded. ---超时。程序没在规定时间内出答案。(TLE)<BR>
			<DIV class=spctrl></DIV>　　5.Presentation Error. ---格式错。程序没按规定的格式输出答案。(PE)<BR>
			<DIV class=spctrl></DIV>　　6.Memory Limit Exceeded. ---超内存。程序没在规定空间内出答案。(MLE)<BR>
			<DIV class=spctrl></DIV>　　7.Compile Error. ---编译错。程序编译不过。(CE)
			<DIV class=bpctrl></DIV>
			<H2>
		<A 
			name=4></A>区域和全球决赛</H2>　　赛事由各大洲区域预赛和全球总决赛两个阶段组成。各预赛区第一名自动获得参加全球总决赛的资格。决赛安排在每年的3-4月举行，而区域预赛一般安排在上一年的9-12月举行。一个大学可以有多支队伍参加区域预赛，但只能有一支队伍参加全球总决赛。 
			<BR>
			<DIV 
			class=spctrl></DIV>　　全球总决赛第一名将获得奖杯一座。另外，成绩靠前的参赛队伍也将获得金、银和铜牌。而解题数在中等以下的队伍会得到确认但不会进行排名。
			<DIV style="CLEAR: both" class=bpctrl></DIV><BR><SPAN class=arr><A title=返回首页 
			href="http://baike.baidu.com/view/201684.htm#" 
			name=STAT_ONCLICK_UNSUBMIT_CATALOG_RETURN></A></SPAN>
			<DIV id=lemmaExtend>
			<DIV class=ref>
			<DIV class=refDiv1>
</td>
</tr>
</table>
</tr>
</table>
</td>
</tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
