@foreach ($home_blocks as $key => $home_block)
    <div class="flex items-center md:items-start justify-center md:justify-between flex-col md:flex-row gap-5 mt-10">
        <div class="p-3 border-t w-full">
            <h2 class="text-3xl font-bold flex items-center justify-between">{{$home_block->title}}
                <a href="{{$home_block->route}}" class="relative inline-block px-4 py-2 font-medium group text-base">
                    <span class="absolute inset-0 w-full h-full transition duration-200 ease-out transform translate-x-1 translate-y-1 bg-black group-hover:-translate-x-0 group-hover:-translate-y-0"></span>
                    <span class="absolute inset-0 w-full h-full bg-white border-2 border-black group-hover:bg-black"></span>
                    <span class="relative text-black group-hover:text-white transition-all">View More</span>
                </a>
            </h2>
            <div class="mt-8">
                <p class="max-w-[600px] text-neutral-500">{{ $home_block->short_description }}</p>
            </div>
            @php
                $products = $home_block->Products()->latest('id')->take(8)->get();
            @endphp
            <div class="mt-5">
                <div class="owl-carousel_normal owl-carousel owl-theme mb-6 h-100">
                    @foreach ($products as $product)
                        @include('front.template2.product-loop')
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endforeach