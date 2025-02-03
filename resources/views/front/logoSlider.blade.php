{{-- These are needed in the heading section
<link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.carousel.min.css')}}">
<link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.theme.default.min.css')}}"> 
--}}

<?php
    $sliders =  App\Models\LogoSlider::active()->get();
?>
<style>
.image-style{
    width:100px; 
    height: 100px;
    padding: 10px
}
</style>
<div class="owl-carousel owl-theme">
    @foreach ($sliders as $slider)
        <div class="item"><img src="{{asset('logos/'.$slider->image)}}" alt="Slide 1" class="image-style"></div>
    @endforeach
    {{-- <div class="item"><img src="{{asset('img/logo.png')}}" alt="Slide 2" class="image-style"></div>
    <div class="item"><img src="{{asset('img/logo.png')}}" alt="Slide 3" class="image-style"></div>
    <div class="item"><img src="{{asset('img/logo.png')}}" alt="Slide 3" class="image-style"></div>
    <div class="item"><img src="{{asset('img/logo.png')}}" alt="Slide 3" class="image-style"></div>
    <div class="item"><img src="{{asset('img/logo.png')}}" alt="Slide 3" class="image-style"></div>
    <div class="item"><img src="{{asset('img/logo.png')}}" alt="Slide 3" class="image-style"></div> --}}
</div>
<script src="{{ asset('front/OwlCarousel/dist/owl.carousel.min.js') }}"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        $(".owl-carousel").owlCarousel({
            loop: true,
            margin: 10,
            nav: true,
            dots: true,
            items: 5
        });
    });
</script>
