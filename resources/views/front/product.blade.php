@extends('front.layouts.master')
@section('head')
    @include('meta::manager', [
        'title' => $product->title . ' - ' . ($settings_g['title'] ?? env('APP_NAME')),
        'image' => $product->img_paths['medium'],
        'description' => $product->meta_description,
        'keywords' => $product->meta_tags
    ])

    <link href="{{asset('front/magiczoomplus.css')}}?c=1" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.theme.default.min.css')}}">
    <link rel="stylesheet" href="{{asset('front/product-details-1.0.0.css')}}">
        
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
    $rating = 0;
    foreach($product->review as $review){
        $rating +=$review->rating;
    }
    $average = $product->review->count() > 0 ? $rating / $product->review->count() : 0;
    $rest = 5 - round($average);
 
@endphp
@section('master')
<div class="{{ $container }}">
    @include('front.layouts.breadcrumb', [
        'title' => $product->title,
        'url' => $product->route
    ])
     @if($template ==3)
        <div>
            <div class="grid grid-cols-1 lg:grid-cols-2 md:gap-5 gap-2">
                <div class="flex items-center justify-center" id="desktop">
                    <div class="flex flex-col gap-3">
                        <div class="border rounded-lg overflow-hidden shadow-md relative w-full h-[400px]">
                            <img id="zoom_product_image" src="{{$product->img_paths['original']}}" 
                                 alt="{{$product->title}}" 
                                 class="w-full h-full object-contain object-center">
                        </div>
                        <div class="flex gap-3 items-center justify-start">
                            @if(count($product->activeVideos) > 0)
                                <img src="{{ asset('uploads/image/video_player.png') }}" class="w-[100px] md:w-[100px] border rounded-lg cursor-pointer hover:opacity-70 transition-all" alt="{{ $product->title }}" onclick="openVideoPopup()" />
                                <div id="videoPopup" class="popup-overlay">
                                    <div class="popup-content">
                                        <span class="close-btn" onclick="closeVideoPopup()">&times;</span>
                                        @foreach ($product->activeVideos as $video)
                                            @if($video->status == 1)
                                                <div class="embed-responsive embed-responsive-16by9">
                                                    {!! $video->embed_video !!}
                                                </div>
                                                @break
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            @endif
                            @if(count($product->Gallery) > 0)
                                <div class="shadow-md cursor-pointer hover:shadow-lg" onclick="changeProductImage('{{$product->img_paths['original']}}');">
                                    <img src="{{$product->img_paths['small']}}" class="w-full h-20 object-cover rounded-lg">
                                </div>
                                @foreach ($product->Gallery as $gallery)
                                    <div class="shadow-md cursor-pointer hover:shadow-lg" onclick="changeProductImage('{{$gallery->paths['original']}}');">
                                        <img src="{{$gallery->paths['small']}}" class="w-full h-20 object-cover rounded-lg">
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
                <div class="owl-carousel owl-theme" id="mobile">
                    <div class="item">
                        <div class="shadow-md cursor-pointer hover:shadow-lg">
                            <img src="{{$product->img_paths['original']}}" class="w-full h-[400px] object-cover rounded-lg">
                        </div>
                    </div>
                    @if(count($product->Gallery) > 0)
                        @foreach ($product->Gallery as $gallery)
                            <div class="item">
                                <div class="shadow-md cursor-pointer hover:shadow-lg">
                                    <img src="{{$gallery->paths['original']}}" class="w-full h-[400px] object-cover rounded-lg">
                                </div>
                            </div>
                        @endforeach
                    @endif
                    @if(count($product->activeVideos) > 0)
                        @foreach ($product->activeVideos as $video)
                            @if($video->status == 1)
                                <div class="item">
                                    <div class="mobile-embed embed-responsive embed-responsive-16by9">
                                        {!! $video->embed_video !!}
                                    </div>
                                </div>
                                @break
                            @endif
                        @endforeach
                    @endif
                </div>
                <div>
                    <div class="flex flex-col gap-3 text-wrap">
                        @foreach($product->Categories->splice(0,1) as $cat)
                            {{$cat->title}}
                        @endforeach
                        <h2 class="text-xl md:text-2xl font-semibold">{{ $product->title }}</h2>
                        <div>
                            @if($product->type && $product->type=="Variable" && count($product->VariableProductData))
                                <input type="hidden" value="{{ $product->VariableProductData[0]['unit_amount']??1 }}" id="unit_default_val">
                                <span class="text-teal-600 font-semibold text-sm md:text-lg mx-0">
                                <span><span class="unit_show">{{ $product->VariableProductData[0]['unit_amount']??1 }}</span></span>
                                </span>
                                <span class="text-gray-600 text-sm">{{ $product->VariableProductData[0]['unit']??'Pcs' }}</span>
                                <span class="text-white px-3 py-1 rounded shadow {{ $product->stock > 0 ? 'bg-green-600' : 'bg-red-600' }}"> {{ $product->stock > 0 ? 'In Stock' : 'Out of Stock' }} </span>
                            @else
                                <input type="hidden" value="{{ $product->productData['unit_amount']??1 }}" id="unit_default_val">
                                <span class="text-teal-600 font-semibold text-sm md:text-lg mx-0">
                                <span><span class="unit_show">{{ $product->productData['unit_amount']??1 }}</span></span>
                                </span>
                                <span class="text-gray-600 text-sm">{{ $product->productData['unit']??'Pcs' }}</span>
                                <span class="text-white px-3 py-1 rounded shadow {{ $product->stock > 0 ? 'bg-green-600' : 'bg-red-600' }}"> {{ $product->stock > 0 ? 'In Stock' : 'Out of Stock' }} </span>
                            @endif
                       </div>
                        <div class="flex items-end gap-2">
                            <input type="hidden" id="price_value" value="{{ $product->prices['sale_price'] }}">
                            <h5 class="text-2xl font-semibold">{{ $settings_g['currency_symbol'] ?? '৳' }}<span class="price_show single_product_price">{{$product->prices['sale_price']}}</span> </h5>
                            @if($product->prices['regular_price'] > 0 && $product->prices['regular_price'] > $product->prices['sale_price'])
                                <span class="text-neutral-500 line-through">/{{ $settings_g['currency_symbol'] ?? '৳' }}<span class="price_show2">{{ $product->prices['regular_price'] }}</span></span>
                            @endif
                        </div>
                        <div class="sp_variation mb-4">
                            @foreach ($product->VariableAttributes as $key=>$attribute)
                                <div><span class="mr-2 mt-2 d-inline-block"><b>{{$attribute->name}}:</b></span></div>

                                <ul class="sp_variation_all npnls overflow-hidden">
                                    @foreach ($attribute->AttributeItems as $key2=>$attribute_item)
                                        @if(in_array($attribute_item->id, $product->attribute_items_arr))
                                            <li>
                                                <input type="radio" name="attr_id_{{$attribute->id}}" {{ $key == $key?'checked':'' }} id="av_id_{{$attribute_item->id}}" class="co_radio" value="{{$attribute->id . ':' . $attribute_item->id}}">
                                                <label for="av_id_{{$attribute_item->id}}" class="cartOptions">{{$attribute_item->name}}</label>
                                            </li>
                                        @endif
                                    @endforeach
                                </ul>
                            @endforeach
                            <span class="mt-2 flex items-center font-bold"> Rating: &nbsp; 
                                @for($i = 1; $i <= 5; $i++)
                                    @if($i <= $product->average_rating)
                                        <svg class="w-5 h-5 me-1 text-yellow-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                    @else
                                        <svg class="w-5 h-5 me-1 text-gray-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                    @endif
                                @endfor
                            </span>
                        </div>

                        <form method="get" action="{{route('cart.directOrder')}}">
                            @csrf
                            <input type="hidden" name="product" value="{{ $product->id }}">
                            @if($product->type && $product->type=="Variable" && count($product->VariableProductData))
                                <input type="hidden" class="product_data_id" name="product_data_id" value="{{ $product->VariableProductData[0]['id'] }}">
                            @endif
                            <div class="relative flex items-center max-w-[8rem]">
                                <button type="button" id="decrement-button" onclick="inputChangeEv(0)" data-input-counter-decrement="quantity-input" class="bg-gray-100 hover:bg-gray-200 border border-gray-300 rounded-s-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                    <svg class="w-3 h-3 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h16"/>
                                    </svg>
                                </button>
                                <input type="text" name="quantity" id="quantity-input" data-input-counter data-input-counter-min="1" data-input-counter-max="50" aria-describedby="helper-text-explanation" class="single_cart_quantity bg-gray-50 border-x-0 border-gray-300 h-11 text-center text-gray-900 text-sm focus:ring-blue-500 focus:border-blue-500 block w-full py-2.5" placeholder="999" value="1" readonly required/>
                                <button type="button" id="increment-button" onclick="inputChangeEv(1)" data-input-counter-increment="quantity-input" class="bg-gray-100 hover:bg-gray-200 border border-gray-300 rounded-e-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                    <svg class="w-3 h-3 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16"/>
                                    </svg>
                                </button>
                            </div>
                            <div class="flex items-center gap-1 md:gap-3 mt-5 justify-center md:justify-start">
                                <button type="submit" class="inline-flex items-center justify-center w-auto px-8 py-2 overflow-hidden font-bold text-white transition-all duration-300 bg-[#f65004] hover:bg-[#007789] ring-1 ring-[#f65004] hover:ring-[#007789] ring-offset-2 ring-offset-[#f65004] hover:ring-offset-[#007789] rounded-full cursor-pointer group ease focus:outline-none">
                                    <span class="transition-colors duration-300">Buy Now</span>
                                </button>                                                                                              

                                <button type="button" onclick="addToCart2('{{$product->id}}')" class="rounded-full px-3 py-2 overflow-hidden relative group cursor-pointer ring-1 font-medium flex items-center ring-[#007789] hover:bg-[#007789] justify-center gap-2 text-black hover:text-white">
                                    <span class="absolute w-64 h-0 transition-all duration-300 origin-center rotate-45 -translate-x-20 top-1/2 group-hover:h-64 group-hover:-translate-y-32 ease"></span>
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 relative transition-all">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                                    </svg>
                                    <span class="relative transition duration-300 ease mt-1">Add to Bag</span>
                                </button>
                            </div>
                        </form>
                        <div class="flex items-center gap-1 md:gap-3 mt-5 justify-start md:justify-start w-[80%]">
                            <div class="inline-flex items-center justify-start gap-1 rounded flex-1">
                                <div>
                                    <img src="https://cdn-icons-png.flaticon.com/512/66/66841.png" alt="delivery icon" loading="lazy" class="w-12">
                                </div>
                                <div>
                                    @if ($product->delivery)
                                        <p class="text-lg whitespace-normal">Delivery In {{$product->delivery}} Working Day(s)</p>
                                    @else
                                        <p class="text-lg whitespace-normal">Fast Delivery</p>
                                    @endif
                                </div>
                            </div>
                            <div class="inline-flex items-center justify-start gap-1 rounded flex-1">
                                <div>
                                    <img src="https://media.istockphoto.com/id/1360644683/vector/24-hour-icon-rotating-arrow-vector.jpg?s=612x612&w=0&k=20&c=frnqCBtIDuBFwRUyp0BcYQlOIStT7voGzpL6KbIvm0I=" alt="delivery icon" loading="lazy" class="w-12">
                                </div>
                                <div>
                                    <p class="text-lg whitespace-normal">24/7 Customer Service</p>
                                </div>
                            </div>
                        </div>

                        <div class="flex flex-col md:flex-row gap-3 mt-5 w-[80%]">
                            <div class="flex w-full md:w-1/2">
                                <a href="https://api.whatsapp.com/send?phone={{ $settings_g['whatsapp_number'] }}&amp;text={{ Request::url() }}&amp;" 
                                   class="flex items-center gap-2 rounded flex-1 text-lg font-bold border p-2 transition-transform duration-300 hover:scale-105 hover:bg-[#007789] hover:text-white hover:shadow-xl">
                                    <img src="https://pngimg.com/d/whatsapp_PNG21.png" alt="whatsapp" class="w-[30px]">
                                    <span class="text-sm">WhatsApp</span>
                                </a>
                            </div>
                            <div class="flex w-full md:w-1/2">
                                <span class="flex items-center gap-2 rounded flex-1 text-lg font-bold border p-2 transition-transform duration-300 hover:scale-105 hover:bg-[#ea9901] hover:text-white hover:shadow-xl">
                                    <img src="{{ asset('img/warranty.png') }}" alt="delivery icon" loading="lazy" class="w-[30px]">
                                    <span class="text-sm">{{ $product->warranty ?? 'No' }} Warranty</span>
                                </span>
                            </div>
                        </div>
                        @if($product->brand)
                        <div class="flex flex-col md:flex-row gap-3 mt-5 w-[80%]">
                            <div class="flex w-full md:w-1/2">
                                <span class="flex items-center gap-2 rounded flex-1 text-lg font-bold border p-2 transition-transform duration-300 hover:scale-105 hover:bg-[#f65004] hover:text-white hover:shadow-xl">
                                    <span class="text-md">Brand: &nbsp;</span>
                                    <img src="{{ $product->brand->img_paths['small'] }}" alt="Brand Icon" loading="lazy" class="w-[30px]">
                                </span>
                            </div>
                        </div>
                        @endif
                        
                    </div>
                </div>
            </div>

            <div class="mb-4 border-b border-gray-200 dark:border-gray-700">
                <ul class="flex flex-wrap -mb-px text-sm font-medium text-center" id="default-tab" data-tabs-toggle="#default-tab-content" role="tablist">
                    <li class="me-2" role="presentation">
                        <button class="inline-block p-4 border-b-2 rounded-t-lg" id="description-tab" data-tabs-target="#description" type="button" role="tab" aria-controls="description" aria-selected="false">Description</button>
                    </li>
                    <li class="me-2" role="presentation">
                        <button class="inline-block p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300" id="nutrition-tab" data-tabs-target="#nutrition" type="button" role="tab" aria-controls="nutrition" aria-selected="false">Nutrition</button>
                    </li>
                    <li class="me-2" role="presentation">
                        <button class="inline-block p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300" id="reviews-tab" data-tabs-target="#reviews" type="button" role="tab" aria-controls="reviews" aria-selected="false">Reviews</button>
                    </li>
                </ul>
            </div>
            <div id="default-tab-content">
                <div class="hidden p-4 rounded-lg" id="description" role="tabpanel" aria-labelledby="description-tab">
                    <div class="content">{!! $product->description !!}</div>
                </div>
                <div class="hidden p-4 rounded-lg" id="nutrition" role="tabpanel" aria-labelledby="nutrition-tab">
                    <div class="content">{!! $product->nutrition !!}</div>
                </div>
                <div class="hidden p-4 rounded-lg bg-gray-50" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                    <!-- Customer Reviews Section -->
                    <div class="max-w-2xl mx-auto mt-8">
                        <h2 class="text-2xl font-semibold text-center mb-6">Customer Reviews</h2>
                
                        <!-- Average Rating -->
                        <div class="text-center mb-6">
                            <div class="flex items-center justify-center space-x-2">
                                <div class="flex items-center">
                                    @for ($i = 1; $i <= 5; $i++)
                                        <svg class="w-6 h-6 {{ $i <= $average ? 'text-yellow-400' : 'text-gray-300' }}" fill="currentColor" viewBox="0 0 24 24">
                                            <path d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.921-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.783-.57-.38-1.81.588-1.81h4.915a1 1 0 00.95-.69l1.519-4.674z" />
                                        </svg>
                                    @endfor
                                </div>
                                <p class="text-lg font-medium text-gray-700">
                                    {{ number_format($average, 1) }} out of 5
                                </p>
                            </div>
                            <p class="text-sm text-gray-500 mt-2">{{ $product->review->count() }} reviews</p>
                        </div>
                
                        <!-- Individual Reviews -->
                        <div class="space-y-6">
                            @foreach ($product->review as $review)
                                <div class="bg-white p-6 rounded-lg shadow-md">
                                    <div class="flex items-center mb-4">
                                        <figcaption class="flex items-center mt-4 space-x-3">
                                            <img class="w-8 h-8 rounded-full" src="{{ $review->user->profile_path }}" alt="{{ $review->user->full_name }}">
                                            <div class="text-sm font-medium text-gray-900">{{ $review->user->full_name }}</div>
                                        </figcaption>
                                        <!-- Star rating -->
                                        <div class="flex items-center pl-3 mt-3">
                                            @for ($i = 1; $i <= 5; $i++)
                                                <svg class="w-5 h-5 {{ $i <= $review->rating ? 'text-yellow-400' : 'text-gray-300' }}" fill="currentColor" viewBox="0 0 24 24">
                                                    <path d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.921-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.783-.57-.38-1.81.588-1.81h4.915a1 1 0 00.95-.69l1.519-4.674z" />
                                                </svg>
                                            @endfor
                                        </div>
                                    </div>
                                    <!-- Review Text -->
                                    <blockquote>
                                        <p class="text-gray-700">{{ $review->review }}</p>
                                    </blockquote>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <!-- Review Form Section -->
                    <div class="max-w-2xl mx-auto mt-4">
                        @if (Auth::check())
                            <div class="bg-white p-6 rounded-lg shadow-md">
                                <h2 class="text-xl font-semibold mb-4">Leave a Review</h2>
                                <form id="reviewForm" action="{{ route('back.add.reviews') }}" method="POST">
                                    @csrf
                                    <!-- Review Textarea -->
                                    <div class="mb-4">
                                        <label for="review" class="block mb-2 text-sm font-medium text-gray-700">
                                            Your Review
                                        </label>
                                        <textarea id="review" name="review" rows="4"
                                            class="w-full p-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                            placeholder="Write your review here..." required></textarea>
                                    </div>
                                
                                    <!-- Rating Section -->
                                    <div class="mb-4">
                                        <label class="block mb-2 text-sm font-medium text-gray-700">
                                            Your Rating
                                        </label>
                                        <div class="flex space-x-1">
                                            <input type="hidden" id="rating" name="rating" value="0">
                                            @for ($i = 1; $i <= 5; $i++)
                                                <svg class="w-8 h-8 text-gray-300 cursor-pointer star hover:text-yellow-400 transition-colors duration-200" data-value="{{ $i }}" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.921-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.783-.57-.38-1.81.588-1.81h4.915a1 1 0 00.95-.69l1.519-4.674z" />
                                                </svg>
                                            @endfor
                                        </div>
                                    </div>
                                
                                    <!-- Hidden Product ID -->
                                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                                
                                    <!-- Submit Button -->
                                    <div class="mt-6">
                                        <button type="submit"
                                            class="px-6 py-2 text-white bg-blue-500 rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-colors duration-200">
                                            Submit Review
                                        </button>
                                    </div>
                                </form>
                            </div>
                        @else
                            <div class="text-center py-6">
                                <p class="text-gray-600">You are not logged in. <a href="{{ route('login') }}" class="text-blue-500 hover:underline">Log in</a> to leave a review.</p>
                            </div>
                        @endif
                    </div>
                </div>
                
            </div>
        </div>
    @else
        <div class="mt-6">
            <div class="grid grid-cols-1 md:grid-cols-9 gap-14">
                <div class="col-span-1 md:col-span-4">
                    <div class="grid grid-cols-8 gap-2">
                        <div class="hidden md:block">
                            <div class="grid grid-cols-1 gap-2">
                                <a data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$product->img_paths['original']}}" data-image="{{$product->img_paths['original']}}" data-zoom-id="zoom-v" class="block shadow cursor-pointer hover:shadow-lg">
                                    <img src="{{$product->img_paths['small']}}" onclick="changeProductImage('{{$product->img_paths['original']}}');" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                </a>

                                @foreach ($product->Gallery as $gallery)
                                    <div data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$gallery->paths['original']}}" data-image="{{$gallery->paths['original']}}" class="block shadow cursor-pointer hover:shadow-lg" onclick="changeProductImage('{{$gallery->paths['original']}}');">
                                        <img src="{{$gallery->paths['small']}}" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                    </div>
                                @endforeach
                            </div>
                        </div>

                        <div class="col-span-8 md:col-span-7">
                            <div class="zoom-gallery real">
                                <a href="{{$product->img_paths['original']}}" class="MagicZoom" id="zoom-v" data-options="zoomMode:true; zoomOn:'hover';">
                                    <img src="{{$product->img_paths['original']}}" alt="{{$product->title}}" class="w-full h-auto object-center shadow-md" width="300" height="160" id="product_preview">
                                </a>
                            </div>

                            <div class="grid grid-cols-3 md:grid-cols-5 lg:grid-cols-7 gap-2 mt-4 md:hidden">
                                <a data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$product->img_paths['original']}}" data-image="{{$product->img_paths['original']}}" data-zoom-id="zoom-v" class="block shadow cursor-pointer hover:shadow-lg">
                                    <img src="{{$product->img_paths['small']}}" onclick="changeProductImage('{{$product->img_paths['original']}}');" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                </a>

                                @foreach ($product->Gallery as $gallery)
                                    <div data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$gallery->paths['original']}}" data-image="{{$gallery->paths['original']}}" class="block shadow cursor-pointer hover:shadow-lg" onclick="changeProductImage('{{$gallery->paths['original']}}');">
                                        <img src="{{$gallery->paths['small']}}" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-span-1 md:col-span-5">
                    <h1 class="text-sm md:text-2xl font-medium tracking-tight text-[#222]">{{$product->title}}</h1>

                    <p class="mt-4 text-xl text-[#7d7d7d] font-medium mb-8"><span class="single_product_price">{{$product->prices['sale_price']}} Tk</span> @if($product->prices['regular_price'] > 0)<span class="text-black line-through text-xl">{{$product->prices['regular_price']}} Tk</span>@endif</p>

                    <div class="sp_variation mb-8">
                        @foreach ($product->VariableAttributes as $attribute)
                            <div><span class="mr-2 mt-2 d-inline-block"><b>{{$attribute->name}}:</b></span></div>

                            <ul class="sp_variation_all npnls overflow-hidden">
                                @foreach ($attribute->AttributeItems as $attribute_item)
                                    @if(in_array($attribute_item->id, $product->attribute_items_arr))
                                        <li>
                                            <input type="radio" name="attr_id_{{$attribute->id}}" id="av_id_{{$attribute_item->id}}" class="co_radio" value="{{$attribute->id . ':' . $attribute_item->id}}">
                                            <label for="av_id_{{$attribute_item->id}}" class="cartOptions">{{$attribute_item->name}}</label>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        @endforeach
                    </div>

                    <button type="button" class="hover:bg-[#222] border border-[#222] py-2 px-2 md:px-4 items-center justify-center text-base font-medium hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 block mt-2 w-full mb-2" onclick="addToCart('{{$product->id}}')">Add to Cart</button>

                    <a style="display: block;text-align: center;" href="{{route('cart.directOrder', ['product' => $product->id])}}" class="bg-[#222] hover:bg-[#c35b58] border border-transparent py-2 px-2 md:px-4 items-center justify-center text-base font-medium text-white focus:outline-none focus:ring-2 focus:ring-offset-2 block w-full">BUY IT NOW</a>

                    <h2 class="font-semibold mb-2 text-xl mt-4">Description</h2>
                    <input name="quantity" type="hidden" value="1" id="single_cart_quantity">

                    <div class="mb-2 responsive_video">
                        {!! $product->description !!}
                    </div>
                </div>
            </div>
        </div>
    @endif

    <div class="mt-6">
        <h2 class="relative text-2xl mt-12 mb-10"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">Related Products</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>
            @if($template == 2)
                <div class="owl-carousel_normal owl-carousel owl-theme mb-10">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.template2.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @elseif($template == 3)
                <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 mb-6 gap-2 md:gap-6">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.template3.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @else
                <div class="owl-carousel_normal owl-carousel owl-theme mb-10">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.layouts.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @endif
    </div>
</div>
@endsection

@section('footer')

    <script src="{{asset('front/OwlCarousel/dist/owl.carousel.min.js')}}"></script>

    <script src="{{asset('front/magiczoomplus.js')}}?c=1"></script>

    <script>
        $('.owl-carousel_normal').owlCarousel({
            items: 4,
            loop: true,
            video: true,
            autoplay: true,
            autoplayTimeout: 2000,
            autoplayHoverPause: true,
            margin: 10,
            nav: true,
            dots: true,
            responsive: {
                0: {
                    items: 2,
                    margin: 10,
                },
                600: {
                    items: 2,
                    margin: 20,
                },
                1000: {
                    items: 5,
                    margin: 30,
                }
            },
            lazyLoad: false
        });

        $(".owl-carousel").owlCarousel({
            items: 1,
            loop: false,
            nav: true,
            dots: true,
            autoplay: false,
            navText: ["<span class='prev'>&#10094;</span>", "<span class='next'>&#10095;</span>"], // Unicode arrows for better visibility
            responsive: {
                0: {
                    items: 1,
                },
                600: {
                    items: 1,
                },
                1000: {
                    items: 1,
                },
            },
        });

    </script>

    <script src="{{asset('front/fitvids.js/jquery.fitvids.js')}}"></script>
    <script>
        $(document).ready(function(){
            $(".responsive_video").fitVids()
            zoomProduct();
        });
    </script>

    @if(env('APP_FB_TRACK'))
    <script>
        fbq('track', 'ViewContent', {
            value: '{{$product->prices["sale_price"]}}',
            currency: 'BDT',
            content_ids: '{{$product->id}}',
            content_type: 'product',
        });
    </script>
    @endif

    @if(Info::Settings('fb_api', 'track') == 'Yes')
    <script>
        // FB Conversion Track(PageView)
        $(window).on('load', function() {
            $.ajax({
                type: "POST",
                url: "{{ route('fbTrack') }}",
                data: {
                    _token: '{{csrf_token()}}',
                    track_type: 'ViewContent',
                    data: {
                        value: '{{$product->prices["sale_price"]}}',
                        currency: 'BDT',
                        content_ids: '{{$product->id}}',
                        content_type: 'product',
                    }
                },
                success: function (response) {
                    if(response == 'true'){
                        console.log('FB Tracked Page Viewed!');
                    }else{
                        console.log('FB Tracked Failed');
                    }
                },
                error: function(){
                    console.log('FB Tracked Error Page View!');
                }
            });
        });
    </script>
    @endif

    <script>
        function disChange(qty){
            let pp2 = Number({{ $product->prices['regular_price'] }});
            if(qty >= 1 && pp2 > 0){
                let r_price = Number(pp2 * qty)
                $('.price_show2').html(r_price)
            }
        }
        function inputChangeEv(type=null){
            let qty = Number($("#quantity-input").val())
            let untV = Number($("#unit_default_val").val())
            if(type == 1) qty = Number(qty + 1)
            else if(type == 0) qty = Number(qty-1)
            if(qty >= 1){
                let o_price = Number($("#price_value").val());
                let price = Number(o_price * qty)
                $('.price_show').html(price)
                $('.unit_show').html((untV * qty))
                disChange(qty)
            }
        }
        // Get Variable price
        $(document).on('change', '.co_radio', function () {
            // Get Data
            let product = "{{$product->id}}";
            let attribute_values = $("input.co_radio:checked").map(function () {
                return $(this).val();
            });

            let values = attribute_values.get();
            values = values.sort();

            // Ajax Action
            $.ajax({
                url: "{{route('product.variationPrice')}}",
                method: "POST",
                data: {values, product, _token: "{{csrf_token()}}"},
                dataType: "JSON",
                success: function (result) {
                    if(result.status == true){
                        // $('.add_to_cart').removeClass('disabled');
                        // $('.no_stock_alert').hide();
                        $('.single_product_price').html(result.sale_price);
                        $('#price_value').val(result.sale_price);
                        $('.product_data_id').val(result.product_data_id);
                        // $('.maximum_stock').val(result.stock);
                        // $('.cart_quantity_input').val(1);
                    }else{
                        $('.product_data_id').val('');
                    }
                    inputChangeEv()

                    // if(result.sku){
                    //     $('.sku_code').html(result.sku);
                    // }else{
                    //     $('.sku_code').html('N/A');
                    // }
                },
                error: function (){
                    console.log('Variation price ajax error!');
                }
            });
        });
    </script>

    {{-- Functions for showing product video --}}
    <script>
        // Function to open the video popup
        function openVideoPopup() {
            $('#videoPopup').css('display', 'flex');
        }

        // Function to close the video popup
        function closeVideoPopup() {
            $('#videoPopup').css('display', 'none');
            pauseYouTubeVideo(); // Pause the YouTube video when the popup closes
        }

        // Close the popup if the user clicks outside the content
        $(document).on('click', function(event) {
            const popup = $('#videoPopup');
            if (event.target === popup[0]) {
                closeVideoPopup();
            }
        });

        // Function to pause the YouTube video
        function pauseYouTubeVideo() {
            const iframe = $('#videoPopup iframe')[0];
            if (iframe) {
                const iframeSrc = iframe.src; // Get the current src of the iframe
                iframe.src = iframeSrc; // Reset the src to stop the video
            }
        }
    </script>

    {{-- Functions for zooming product image --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/jquery.elevatezoom.min.js"></script>
    <script>
        function changeProductImage(path){
            $('#zoom_product_image').attr('src', '');
            $('#zoom_product_image').attr('src', path);
            $('.zoomContainer').remove();
            $('#zoom_product_image').removeData('elevateZoom');
            zoomProduct();
        }

        function zoomProduct(){
            const isLargeScreen = window.matchMedia("(min-width: 768px)").matches;

            if (isLargeScreen) {
                $('#zoom_product_image').elevateZoom({
                    zoomType: "window",
                    cursor: "crosshair",
                    zoomWindowFadeIn: 500,
                    zoomWindowFadeOut: 500,
                    zoomWindowWidth: 400,
                    zoomWindowHeight: 400,
                    borderSize: 1,
                    borderColor: "#ddd",
                });
            } else {
                $('#zoom_product_image').removeData('elevateZoom');
                $('#zoom_product_image').removeAttr('data-zoom-image');
            }
            window.matchMedia("(min-width: 768px)").addEventListener('change', zoomProduct);
        }

    </script>
    {{-- Functions for review --}}
    <script>
        $(document).ready(function () {
            // Star Rating Interaction
            $('.star').on('click', function () {
                const value = $(this).data('value');
                $('#rating').val(value);
                $('.star').each(function () {
                    if ($(this).data('value') <= value) {
                        $(this).addClass('text-yellow-400').removeClass('text-gray-300');
                    } else {
                        $(this).addClass('text-gray-300').removeClass('text-yellow-400');
                    }
                });
            });
        });
    </script>
@endsection