# model_path=cllm/consistency-llm-7b-math
model_path=GAIR/Abel-7B-001
target_model_path=GAIR/Abel-7B-001
max_new_tokens=512

# test model is tested and we use the tokenizer of teacher model because the tokenizer of test model has something to fix
# CUDA_VISIBLE_DEVICES=0 python eval/gsm8k/acc.py --model_dir ${model_path} --temperature 0.0 --top_p 1.0 --output_file_name 'cllm_generated_gsm8k.jsonl' \
#     --dev_set "gsm8k" --prompt_type math-single --max_new_tokens_for_consistency 512 --max_tokens 1024 --use_consistency_decoding

CUDA_VISIBLE_DEVICES=0 python eval/gsm8k/acc.py --model_dir ${model_path} --temperature 0.0 --top_p 1.0 --output_file_name 'cllm_generated_gsm8k.jsonl' \
    --dev_set "gsm8k" --prompt_type math-single --max_new_tokens_for_consistency 512 --max_tokens 1024 

# python3 eval/gsm8k/speedup.py \
#     --test_model_path ${model_path} \
#     --teacher_model_path ${target_model_path} \
#     --max_new_tokens ${max_new_tokens}