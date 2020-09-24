<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Document</title>

<style>
	#movieImg>img {
		width:400px;
		height:400px;	
	}
</style>

</head>

<body>
	<div id="movieImg">
		<img src="${movie.img}" /> 
		<div>${movie.movieTitle}</div>

	</div>
    <form class="make_star" method="post" action="/movieCmt">
        <div class="rate">
            <i class="fa fa-star" data-rate="1"></i>
            <i class="fa fa-star" data-rate="2"></i>
            <i class="fa fa-star" data-rate="3"></i>
            <i class="fa fa-star" data-rate="4"></i>
            <i class="fa fa-star" data-rate="5"></i>
        </div>
        <input class="hidden1" type="hidden" value=''>
        <textarea></textarea>
        <input type="submit" value="댓글 달기">
    </form>

    <div>
        
    </div>
    

<script>
    $(function(){
        $('.make_star i').click(function(){
            var star = $(this).attr('data-rate'); 
            var targetNum = $(this).index()+1;
            $('.make_star i').css({color:'#000'});
            $('.make_star i:nth-child(-n+'+targetNum +')').css({color:'#f05522'});
            $('.make_star .hidden').val(star); 
        })
    });
</script>    
</body>
</html>