import tensorflow as tf
from keras.models import load_model
# global graph, model, output_list
from .models import DiseaseDetector

#graph = tf.get_default_graph()


output_dict = {'Apple___Apple_scab': 0,
               'Apple___Black_rot': 1,
               'Apple___Cedar_apple_rust': 2,
               'Apple___healthy': 3,
               'Blueberry___healthy': 4,
               'Cherry_(including_sour)___Powdery_mildew': 5,
               'Cherry_(including_sour)___healthy': 6,
               'Corn_gray_leaf_spot': 7,
               'Corn_common_rust_': 8,
               'Corn_northern_leaf_blight': 9,
               'Corn_healthy': 10,
               'Grape___Black_rot': 11,
               'Grape___Esca_(Black_Measles)': 12,
               'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)': 13,
               'Grape___healthy': 14,
               'Orange___Haunglongbing_(Citrus_greening)': 15,
               'Peach___Bacterial_spot': 16,
               'Peach___healthy': 17,
               'Pepper_bacterial_spot': 18,
               'Pepper_healthy': 19,
               'Potato_early_blight': 20,
               'Potato_late_blight': 21,
               'Potato_healthy': 22,
               'Raspberry___healthy': 23,
               'Soybean___healthy': 24,
               'Squash___Powdery_mildew': 25,
               'Strawberry___Leaf_scorch': 26,
               'Strawberry___healthy': 27,
               'Tomato_bacterial_spot': 28,
               'Tomato_early_blight': 29,
               'Tomato_late_blight': 30,
               'Tomato_leaf_mold': 31,
               'Tomato_septoria_leaf_spot': 32,
               'Tomato_spider_mites_two-spotted_spider_mite': 33,
               'Tomato_target_spot': 34,
               'Tomato_yellow_leaf_curl_virus': 35,
               'Tomato_mosaic_virus': 36,
               'Tomato_healthy': 37}

output_list = list(output_dict.keys())