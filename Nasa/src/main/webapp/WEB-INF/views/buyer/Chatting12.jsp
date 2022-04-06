<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<div class="listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content -->
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="row">
                            <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                    <h4>Advanced Filter</h4>
                                </div>
                            </div>
                        </div>
                        <!-- Job Category Listing start -->
                        <div class="category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                                <!-- input -->
                                <div class="input-form">
                                    <input type="text" placeholder="What are you finding?">
                                </div>
                                <!-- Select job items start -->
                                <div class="select-job-items1">
                                    <select name="select1" style="display: none;">
                                        <option value="">Choose categories</option>
                                        <option value="">Category 1</option>
                                        <option value="">Category 2</option>
                                        <option value="">Category 3</option>
                                    </select><div class="nice-select" tabindex="0"><span class="current">Choose categories</span><ul class="list"><li data-value="" class="option selected">Choose categories</li><li data-value="" class="option">Category 1</li><li data-value="" class="option">Category 2</li><li data-value="" class="option">Category 3</li></ul></div>
                                </div>
                                <!--  Select job items End-->
                                <!-- Select job items start -->
                                <div class="select-job-items2">
                                    <select name="select2" style="display: none;">
                                        <option value="">Location</option>
                                        <option value="">Dhaka</option>
                                        <option value="">Mirpur</option>
                                        <option value="">Dannondi</option>
                                    </select><div class="nice-select" tabindex="0"><span class="current">Location</span><ul class="list"><li data-value="" class="option selected">Location</li><li data-value="" class="option">Dhaka</li><li data-value="" class="option">Mirpur</li><li data-value="" class="option">Dannondi</li></ul></div>
                                </div>
                                <!--  Select job items End-->
                                <!-- select-Categories start -->
                                <div class="select-Categories pt-140 pb-20">
                                    <label class="container">Full Time
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="container">Ratings
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <!-- select-Categories End -->
                                <!-- Select job items start -->
                                <div class="select-job-items2">
                                    <select name="select2" style="display: none;">
                                        <option value="">Area (km)</option>
                                        <option value="">Dhaka- 1km</option>
                                        <option value="">Dinajpur- 2km</option>
                                        <option value="">Chittagong - 3km</option>
                                    </select><div class="nice-select" tabindex="0"><span class="current">Area (km)</span><ul class="list"><li data-value="" class="option selected">Area (km)</li><li data-value="" class="option">Dhaka- 1km</li><li data-value="" class="option">Dinajpur- 2km</li><li data-value="" class="option">Chittagong - 3km</li></ul></div>
                                </div>
                                <!--  Select job items End-->
                            </div>

                            <div class="single-listing">
                                <!-- Range Slider Start -->
                                <aside class="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                                    <div class="small-section-tittle2">
                                        <h4>Price range</h4>
                                    </div>
                                    <div class="widgets_inner">
                                        <div class="range_item">
                                            <!-- <div id="slider-range"></div> -->
                                            <span class="irs js-irs-0"><span class="irs"><span class="irs-line" tabindex="-1"><span class="irs-line-left"></span><span class="irs-line-mid"></span><span class="irs-line-right"></span></span><span class="irs-min" style="visibility: hidden;">tk. 0</span><span class="irs-max" style="visibility: visible;">tk. 1.000</span><span class="irs-from" style="visibility: visible; left: 0%;">tk. 0</span><span class="irs-to" style="visibility: visible; left: 42.163%;">tk. 500</span><span class="irs-single" style="visibility: hidden; left: 13.2445%;">tk. 0 - tk. 500</span></span><span class="irs-grid"></span><span class="irs-bar" style="left: 2.3511%; width: 47.6489%;"></span><span class="irs-shadow shadow-from" style="display: none;"></span><span class="irs-shadow shadow-to" style="display: none;"></span><span class="irs-slider from" style="left: 0%;"></span><span class="irs-slider to type_last" style="left: 47.6489%;"></span></span><input type="text" class="js-range-slider irs-hidden-input" value="" readonly="">
                                            <div class="d-flex align-items-center">
                                                <div class="price_text">
                                                    <p>Price :</p>
                                                </div>
                                                <div class="price_value d-flex justify-content-center">
                                                    <input type="text" class="js-input-from" id="amount" readonly="">
                                                    <span>to</span>
                                                    <input type="text" class="js-input-to" id="amount" readonly="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </aside>
                              <!-- Range Slider End -->
                                 <a href="#" class="btn list-btn mt-20">Reset</a>
                            </div>
                        </div>
                        <!-- Job Category Listing End -->
                    </div>
                    <!-- Right content -->
                    <div class="col-xl-8 col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="count mb-35">
                                    <span>5432 Listings are available</span>
                                </div>
                            </div>
                        </div>
                        <!-- listing Details Stat-->
                        <div class="listing-details-area">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list1.png" alt="">
                                                <!-- <span>Open</span> -->
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                <h3><a href="listing_details.html">Saintmartine</a></h3>
                                                <p>700/D, Kings road, Green lane, 85/ London</p>
                                                <div class="list-footer">
                                                    <ul>
                                                        <li>+10 278 367 9823</li>
                                                        <li>contact@midnight.com</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list2.png" alt="">
                                                <!-- <span>Open</span> -->
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="listing_details.html">Saintmartine</a></h3>
                                                <p>700/D, Kings road, Green lane, 85/ London</p>
                                                <div class="list-footer">
                                                    <ul>
                                                        <li>+10 278 367 9823</li>
                                                        <li>contact@midnight.com</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list3.png" alt="">
                                                <!-- <span>Open</span> -->
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="listing_details.html">Saintmartine</a></h3>
                                                <p>700/D, Kings road, Green lane, 85/ London</p>
                                                <div class="list-footer">
                                                    <ul>
                                                        <li>+10 278 367 9823</li>
                                                        <li>contact@midnight.com</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list4.png" alt="">
                                                <!-- <span>Open</span> -->
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="listing_details.html">Saintmartine</a></h3>
                                                <p>700/D, Kings road, Green lane, 85/ London</p>
                                                <div class="list-footer">
                                                    <ul>
                                                        <li>+10 278 367 9823</li>
                                                        <li>contact@midnight.com</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list5.png" alt="">
                                                <!-- <span>Open</span> -->
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="listing_details.html">Saintmartine</a></h3>
                                                <p>700/D, Kings road, Green lane, 85/ London</p>
                                                <div class="list-footer">
                                                    <ul>
                                                        <li>+10 278 367 9823</li>
                                                        <li>contact@midnight.com</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 ">
                                        <div class="single-listing mb-30">
                                            <div class="list-img">
                                                <img src="assets/img/gallery/list6.png" alt="">
                                                <!-- <span>Open</span> -->
                                            </div>
                                            <div class="list-caption">
                                                <span>Open</span>
                                                 <h3><a href="listing_details.html">Saintmartine</a></h3>
                                                <p>700/D, Kings road, Green lane, 85/ London</p>
                                                <div class="list-footer">
                                                    <ul>
                                                        <li>+10 278 367 9823</li>
                                                        <li>contact@midnight.com</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- listing Details End -->
                        <!--Pagination Start  -->
                           <div class="pagination-area pt-70 text-center">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="single-wrap d-flex justify-content-center">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-start">
                                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                                <li class="page-item"><a class="page-link" href="#"><span class="ti-angle-right"></span></a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Pagination End  -->
                    </div>
                </div>
            </div>
        </div>
</body>
</html>