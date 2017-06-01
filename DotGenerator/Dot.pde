public class Dot {
    private int x, y;    //ドット左上の点の座標
    private int dotSize; //ドットサイズ
    
    private float c_r;   //赤
    private float c_g;   //緑
    private float c_b;   //青
    
    private color c; //ドットの平均の色
    private float[] temp_color_distance;
    
    private static final int lp_max = 51; //ループ最大数
  
    //コンストラクタ
    private Dot(int def_x, int def_y, int def_dotSize){
        temp_color_distance = new float[ 52 ];
        c_r                 = red( pixels[ x + y * img.width ] );
        c_g                 = green( pixels[ x + y * img.width ] );
        c_b                 = blue( pixels[ x + y * img.width ] );
        x                   = def_x;
        y                   = def_y;
        dotSize             = def_dotSize;
        
        //ドット内の色の平均
        for(int i = 0; i < dotSize; i++){
            for(int j = 0; j < dotSize; j++){
                c_r += red(pixels[(i + x) + (y + j) * img.width]);
                c_g += green(pixels[(i + x) +(y + j) * img.width]);
                c_b += blue(pixels[(i + x) + (y + j) * img.width]);
            }
        }
        
        c_r = c_r / (dotSize * dotSize);
        c_g = c_g / (dotSize * dotSize);
        c_b = c_b / (dotSize * dotSize);
        
        //ドットの平均とパレット[i]との色の距離
        for(int i = 0; i < lp_max; i++){
            temp_color_distance[i] = 
                (c_r - pallet_r[i]) * (c_r - pallet_r[i])+
                (c_g - pallet_g[i]) * (c_g - pallet_g[i])+
                (c_b - pallet_b[i]) * (c_b - pallet_b[i]);
        }
        //temp_color_distanceが最小になるカラーパレットを探す
        float temp_color_distance_min = temp_color_distance[0];
      
        for(int i = 0; i < lp_max; i++){
            if( temp_color_distance_min > temp_color_distance[i] ){
                temp_color_distance_min = temp_color_distance[i];
            }
            else{
            }
        }
        
        //最小となる＝一番近い色のカラーパレットで色を置き換える
        for(int i = 0; i < lp_max; i++){
            if( temp_color_distance_min == temp_color_distance[i] ){
                c_r = pallet_r[i];
                c_g = pallet_g[i];
                c_b = pallet_b[i];
            }
            else{
            }
        }
    }
    
    //ドットを描くメソッド
    void draw(){
        c = color(int(c_r), int(c_g), int(c_b));
        fill(c);
        rect(x, y, dotSize, dotSize);
    }
}