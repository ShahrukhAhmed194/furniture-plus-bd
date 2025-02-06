{{-- Include Owl Carousel CSS in the <head> --}}
    <link rel="stylesheet" href="{{ asset('front/OwlCarousel/dist/assets/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('front/OwlCarousel/dist/assets/owl.theme.default.min.css') }}">
    
    <?php
        $sliders = App\Models\LogoSlider::active()->get();
    ?>
    
    <style>
        .brand-slider-show .item {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .brand-slider-show img {
            max-width: 150px; /* Ensures logos are a reasonable size */
            max-height: 170px;
            object-fit: contain; /* Prevents stretching */
            transition: transform 0.3s ease-in-out;
        }
        h3.h3 {
            font-size: 24px; /* Adjust as needed */
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
    
    <div class="row">
        <h3 class="h3 text-center text-bold">Trusted by top companies</h3>
        <div class="col-lg-12">
            <div class="col-12 brand-slider-show owl-carousel">
                @foreach ($sliders as $slider)
                    <div class="item card shadow">
                        <a href="javascript:void(0)">
                            <img src="{{ asset('logos/'.$slider->image) }}" alt="Brand Logo" title="Brand Logo">
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    
    <script src="{{ asset('front/OwlCarousel/dist/owl.carousel.min.js') }}"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            $(".brand-slider-show").owlCarousel({
                loop: true,
                // margin: 20,
                nav: false,
                dots: true,
                autoplay: false,
                // autoplayTimeout: 3000,
                autoplayHoverPause: true,
                responsive: {
                    0: { items: 2 },
                    576: { items: 3 },
                    768: { items: 4 },
                    992: { items: 5 },
                    1200: { items: 6 }
                }
            });
        });
    </script>
    