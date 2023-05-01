package com.wolclass.utils;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class KakaoMapAPI {
	private static String key = "0855a981db011b9c4778f98b0871b031";
	
    public static String getKakaoMapScript() throws Exception {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url("//dapi.kakao.com/v2/maps/sdk.js?libraries=services,clusterer,drawing")
                .addHeader("Authorization", "KakaoAK " + key)
                .build();
        Response response = client.newCall(request).execute();
        return response.body().string();
    }
}
