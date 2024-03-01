# from roboflow import Roboflow
# rf = Roboflow(api_key="l73bIMnhr4Mui2reJSPx")
# project = rf.workspace("raman-0g3ds").project("fracturedetection-v83yx")
# model = project.version(1).model

# # infer on a local image
# #print(model.predict("your_image.jpg", confidence=40, overlap=30).json())

# # visualize your prediction
# model.predict("your_image1.jpg", confidence=40, overlap=30).save("prediction1.jpg")

# # infer on an image hosted elsewhere
# # print(model.predict("URL_OF_YOUR_IMAGE", hosted=True, confidence=40, overlap=30).json())




# from flask import Flask, request, jsonify
# from roboflow import Roboflow

# app = Flask(__name__)

# @app.route('/predict', methods=['POST'])
# def predict():
#     try:
#         # Ensure 'image' file is present in the request
#         if 'image' not in request.files:
#             return jsonify({'error': 'No image file provided'}), 400

#         image_file = request.files['image']

#         # Save the received image to a file
#         image_path = 'received_image.jpg'
#         image_file.save(image_path)

#         # Initialize Roboflow and load model
#         rf = Roboflow(api_key="l73bIMnhr4Mui2reJSPx")
#         project = rf.workspace("raman-0g3ds").project("fracturedetection-v83yx")
#         model = project.version(1).model

#         # Run inference on the local image
#         prediction = model.predict(image_path, confidence=40, overlap=30)

#         # Visualize prediction (optional)
#         prediction.save("prediction3.jpg")

#         return jsonify({'prediction': prediction.json()}), 200

#     except Exception as e:
#         return jsonify({'error': str(e)}), 500

# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=5000, debug=True)


from flask import Flask, request, jsonify, send_file
from roboflow import Roboflow

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Ensure 'image' file is present in the request
        if 'image' not in request.files:
            return jsonify({'error': 'No image file provided'}), 400

        image_file = request.files['image']

        # Save the received image to a file
        image_path = 'received_image.jpg'
        image_file.save(image_path)

        # Initialize Roboflow and load model
        rf = Roboflow(api_key="l73bIMnhr4Mui2reJSPx")
        project = rf.workspace("raman-0g3ds").project("fracturedetection-v83yx")
        model = project.version(1).model

        # Run inference on the local image
        prediction = model.predict(image_path, confidence=40, overlap=30)

        # Save the prediction image
        prediction_path = 'prediction3.jpg'
        prediction.save(prediction_path)

        # Return the prediction image to the frontend
        return send_file(prediction_path, mimetype='image/jpeg', as_attachment=True)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
