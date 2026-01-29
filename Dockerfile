# 1. Start with the official RunPod ComfyUI image
FROM runpod/worker-comfyui:5.2.0-base

# 2. Install tool to download files
RUN apt-get update && apt-get install -y wget

# 3. Download your Qwen Model into the correct ComfyUI folder
# (Make sure to verify if this goes in 'checkpoints', 'unet', or 'loras' based on the model type)
WORKDIR /ComfyUI/models/checkpoints
RUN wget -O MyQwenModel.safetensors "https://huggingface.co/User/Repo/resolve/main/model.safetensors?download=true"

# 4. (Optional) Copy your workflow file for safekeeping
# This copies 'qwen.json' from your computer into the image
COPY qwen.json /root/qwen.json

# 5. Reset the working directory so RunPod starts correctly
WORKDIR /ComfyUI
