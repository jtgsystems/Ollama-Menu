@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ==================================
echo    AI Model Selection Menu v1.9
echo  by Joint Technology Group Inc.
echo       JTGSYSTEMS.COM
echo ==================================
echo 1. General Purpose Models
echo 2. Code-Specialized Models
echo 3. Math and Reasoning Models
echo 4. Embedding Models
echo 5. Uncensored Models
echo 6. Medical Models
echo 7. Specialized Models
echo 8. Update Models
echo 9. List Installed Models
echo 10. Exit
echo.

set "choice="
set /p choice="Enter your choice (1-10): "

if "%choice%"=="" goto invalid_choice
if "%choice%"=="10" exit /b
if "%choice%"=="9" goto list_models
if "%choice%"=="8" goto update_models
if "%choice%"=="7" goto specialized
if "%choice%"=="6" goto medical
if "%choice%"=="5" goto uncensored
if "%choice%"=="4" goto embedding
if "%choice%"=="3" goto math
if "%choice%"=="2" goto code
if "%choice%"=="1" goto general
goto invalid_choice

:invalid_choice
echo Invalid choice. Press any key to try again.
pause >nul
goto menu

:list_models
cls
echo ==============================
echo     Installed Models
echo ==============================
echo.
ollama list
echo.
echo Press any key to return to the main menu...
pause >nul
goto menu

:update_models
cls
echo ==============================
echo     Updating Models
echo ==============================
echo.
echo Updating all models...
REM List of English models to update
for %%m in (
    llama3.1
    llama3.2
    llama3.3
    gemma2
    gemma3
    mistral
    mistral-small
    mistral-large
    mixtral
    phi3.5
    phi4
    phi4-mini
    command-r
    command-r-plus
    command-a
    codestral
    codegemma
    codellama
    deepseek-coder-v2
    starcoder2
    wizardcoder
    deepseek-v2
    deepseek-v2.5
    deepseek-r1
    deepscaler
    openthinker
    smallthinker
    r1-1776
    granite3.2
    granite3.2-vision
    falcon3
    granite-embedding
    snowflake-arctic-embed2
    mxbai-embed-large
    all-minilm
    nomic-embed-text
    bge-large
    llama2-uncensored
    dolphin-mixtral
    dolphin-phi
    dolphin-llama3
    dolphincoder
    wizardlm-uncensored
    wizard-vicuna-uncensored
    medllama2
    meditron
    llava-phi3
    llava-llama3
    moondream
    bakllava
    nexusraven
    deepcoder
    cogito
    command-r7b
    olmo2
    qwen2.5-coder
    qwen2-math
    athene-v2
    opencoder
    smollm
    smollm2
    granite3-dense
    granite3-moe
    nemotron
    nemotron-mini
    solar-pro
    hermes3
    codegeex4
    firefunction-v2
    llama3-groq-tool-use
    mathstral
    nous-hermes2-mixtral
    stable-code
    tinydolphin
    qwen
    stablelm2
    neural-chat
    starling-lm
    dbrx
    alfred
    wizardlm2
    nous-hermes2
    notus
    notux
    openhermes
    tinyllama
    llama-pro
    megadolphin
    zephyr
    mistral-openorca
    codebooga
    mistrallite
    xwinlm
    yarn-llama2
    yarn-mistral
    yi
    openchat
    goliath
    deepseek-llm
    magicoder
    stablelm-zephyr
    orca2
    orca-mini
    open-orca-platypus2
    nous-hermes
    vicuna
    wizard-math
    wizard-vicuna
    phind-codellama
    falcon
    sqlcoder
    samantha-mistral
    dolphin-mistral
    everythinglm
    codeup
    stable-beluga
    qwen3
    devstral
    llama4
    qwen2.5vl
    mistral-nemo
    minicpm-v
    qwq
    deepseek-v3
    dolphin3
    bge-m3
    llama2-chinese
    aya
    glm4
    llama3-chatqa
    llama3-gradient
    yi-coder
    solar
    internlm2
    wizardlm
    exaone3.5
    paraphrase-multilingual
    granite3.3
    phi4-reasoning
    shieldgemma
    exaone-deep
    llama-guard3
    reader-lm
    duckdb-nsql
    falcon2
    command-r7b-arabic
    tulu3
    nuextract
    bespoke-minicheck
    granite3-guardian
    phi4-mini-reasoning
    sailor2
    marco-o1
) do (
    echo Updating %%m...
    ollama pull %%m
)
echo.
echo Models updated. Press any key to return to main menu.
pause >nul
goto menu

:general
call :display_submenu "General Purpose Models" ^
    "llama3.1|State-of-the-art Llama 3.1 models (8B, 70B, 405B). [2025-04-22]" ^
    "llama3.2|Compact Llama 3.2 models (1B, 3B). [2025-04-22]" ^
    "llama3.3|High-performance Llama 3.3 70B model. [2025-04-22]" ^
    "gemma2|Efficient Google Gemma2 models (2B, 9B, 27B). [2025-05-08]" ^
    "gemma3|Google's most capable single-GPU Gemma3 model. [2025-05-08]" ^
    "mistral|Mistral AI's Mistral: Efficient 7.3B parameter model. [2025-02-22]" ^
    "mistral-small|Mistral AI's compact high-performing model for low latency. [2025-02-22]" ^
    "mistral-large|Mistral AI's flagship 123B parameter model. [2025-02-22]" ^
    "mixtral|Mistral AI's Sparse Mixture of Experts (SMoE) models (8x7B, 8x22B). [2025-02-22]" ^
    "phi3.5|Microsoft's enhanced Phi-3.5 3.8B model. [2025-05-15]" ^
    "phi4|Microsoft's 14B state-of-the-art Phi-4 model. [2025-05-15]" ^
    "phi4-mini|Microsoft's Phi-4-mini 3.8B with multilingual & reasoning. [2025-05-17]" ^
    "command-r|Cohere's Command-R: 35B conversational & RAG model. [2025-05-12]" ^
    "command-r-plus|Cohere's Command R+: 104B enterprise model for RAG & tool use. [2025-05-12]" ^
    "command-a|Cohere's Command-A: 111B model for demanding enterprise workloads. [2025-05-12]" ^
    "granite3.2|IBM's Granite 3.2: Long-context 2B & 8B models. [2025-04-01]" ^
    "granite3-dense|IBM's Granite3 Dense: Tool-based 2B & 8B models. [2025-04-01]" ^
    "granite3-moe|IBM's Granite3 MoE: 1B & 3B for low latency. [2025-04-01]" ^
    "falcon3|TII's Falcon3: Efficient models under 10B. [2025-03-22]" ^
    "olmo2|AI2's OLMo2: Open 7B & 13B language models. [2025-04-15]" ^
    "command-r7b|Cohere's Command R 7B: Smallest R-series model. [2025-05-12]" ^
    "nemotron|NVIDIA's Nemotron: 70B instruct model. [2025-04-08]" ^
    "nemotron-mini|NVIDIA's Nemotron Mini: 4B for roleplay & RAG. [2025-04-08]" ^
    "solar-pro|Upstage's Solar Pro: 22B model for single GPU. [2025-03-10]" ^
    "hermes3|Nous Research's Hermes3: 3B to 405B models. [2025-02-15]" ^
    "wizardlm2|Microsoft's WizardLM-2: Advanced conversational model. [2024-11-22]" ^
    "nous-hermes2|Nous Research's Hermes2: 10.7B & 34B models. [2025-01-22]" ^
    "notus|Argilla's Notus: 7B chat model based on Zephyr. [2025-03-01]" ^
    "notux|Argilla's Notux: Top-performing MoE model. [2025-03-01]" ^
    "openhermes|Teknium's OpenHermes: 7B fine-tuned on Mistral. [2025-02-01]" ^
    "tinyllama|TinyLlama: Compact 1.1B model. [2024-10-22]" ^
    "llama-pro|Expanded Llama 2 for programming tasks. [2024-09-22]" ^
    "megadolphin|Eric Hartford's MegaDolphin: 120B interleaved Dolphin model. [2025-05-20]" ^
    "zephyr|HuggingFace's Zephyr: Fine-tuned Mistral & Mixtral models. [2025-01-01]" ^
    "mistral-openorca|OpenOrca fine-tune of Mistral 7B. [2025-02-22]" ^
    "mistrallite|Amazon's MistralLite: Long-context Mistral model. [2025-02-22]" ^
    "xwinlm|Xwin-LM: Conversational Llama 2-based model. [2024-12-22]" ^
    "neural-chat|Intel's Neural Chat: Fine-tuned Mistral model. [2025-03-22]" ^
    "openchat|OpenChat: High-performing open-source chat model. [2025-01-15]" ^
    "yi|01.AI's Yi: High-performing 6B, 9B, 34B models. [2025-04-22]" ^
    "goliath| Goliath: Combined Llama 2 70B model. [2024-08-22]" ^
    "alfred|Alfred: Robust conversational model. [2025-03-15]" ^
    "dbrx|Databricks' DBRX: 132B general-purpose MoE model. [2025-04-01]" ^
    "starling-lm|Berkeley's Starling-LM: 7B model for chatbot helpfulness. [2025-02-01]" ^
    "stablelm2|Stability AI's StableLM2: 1.6B & 12B multilingual models. [2025-03-01]" ^
    "qwen3|Alibaba's Qwen3: Series of dense and MoE models. [2025-05-01]" ^
    "llama4|Meta's Llama 4: Latest multimodal models. [2025-05-18]" ^
    "mistral-nemo|Mistral-Nemo: 12B model with 128k context length. [2025-05-01]" ^
    "qwq|Qwen's QWQ: Reasoning model of the Qwen series. [2025-04-15]" ^
    "deepseek-v3|DeepSeek V3: 671B MoE language model. [2025-05-10]" ^
    "dolphin3|Eric Hartford's Dolphin 3.0: Llama 3.1 8B general purpose model [2025-05-20]" ^
    "llama2-chinese|Llama 2 fine-tuned for Chinese dialogue. [2024-07-22]" ^
    "aya|Cohere's Aya: Multilingual models (23 languages). [2025-04-01]" ^
    "glm4|Zhipu AI's GLM-4: Strong multi-lingual general language model. [2025-04-10]" ^
    "llama3-chatqa|NVIDIA's Llama 3 ChatQA: For conversational QA & RAG. [2025-04-22]" ^
    "llama3-gradient|Gradient AI's Llama-3 8B with extended context length. [2025-04-22]" ^
    "solar|Upstage's Solar: Compact 10.7B large language model. [2025-02-10]" ^
    "internlm2|InternLM2: 7B model for practical scenarios with reasoning. [2025-03-05]" ^
    "wizardlm|Microsoft's WizardLM: General use model based on Llama 2. [2024-10-22]" ^
    "exaone3.5|LG AI's EXAONE 3.5: Bilingual (English/Korean) models. [2025-04-01]" ^
    "granite3.3|IBM's Granite 3.3: 2B/8B 128K context models. [2025-05-01]" ^
    "shieldgemma|Google's Shield Gemma: Instruction tuned for safety evaluation. [2025-05-08]" ^
    "exaone-deep|LG AI's EXAONE Deep: Reasoning models (math/coding). [2025-04-01]" ^
    "llama-guard3|Meta's Llama Guard 3: Content safety classification models. [2025-05-18]" ^
    "reader-lm|Reader LM: HTML to Markdown conversion models. [2025-03-15]" ^
    "duckdb-nsql|MotherDuck & DuckDB's DuckDB-NSQL: 7B text-to-SQL model. [2025-04-20]" ^
    "falcon2|TII's Falcon2: 11B causal decoder-only model. [2025-04-25]" ^
    "command-r7b-arabic|Cohere's Command R 7B with advanced Arabic capabilities. [2025-05-12]" ^
    "tulu3|AI2's Tulu3: Instruction following model family. [2025-04-10]" ^
    "nuextract|NuExtract: 3.8B information extraction model based on Phi-3. [2025-05-15]" ^
    "bespoke-minicheck|Bespoke Minicheck: State-of-the-art fact-checking model. [2025-05-01]" ^
    "granite3-guardian|IBM's Granite3 Guardian: Risk detection for prompts/responses. [2025-05-01]" ^
    "sailor2|Sailor2: Multilingual models for South-East Asia. [2025-04-18]" ^
    "marco-o1|Alibaba's Marco-o1: Open large reasoning model [2025-05-05]"
goto menu

:code
call :display_submenu "Code-Specialized Models" ^
    "codestral|Mistral AI's Codestral: 22B specialized code model. [2025-05-15]" ^
    "codegemma|Google's CodeGemma: 2B & 7B open code models. [2025-04-24]" ^
    "codellama|Meta's Code Llama: 7B-70B models for code generation, infilling. [2024-12-22]" ^
    "deepseek-coder-v2|DeepSeek Coder V2: Advanced 16B & 236B MoE code models. [2025-05-01]" ^
    "starcoder2|BigCode's StarCoder2: 3B, 7B, 15B, 600+ languages. [2025-03-22]" ^
    "wizardcoder|WizardLM's WizardCoder: 33B SOTA code model from StarCoder. [2025-01-22]" ^
    "qwen2.5-coder|Alibaba's Qwen2.5 Coder: 0.5B to 32B code models. [2025-05-01]" ^
    "codegeex4|CodeGeeX4: 9B multilingual model for software development. [2025-04-10]" ^
    "granite-code|IBM's Granite Code: 3B to 34B open-source code models. [2025-03-15]" ^
    "phind-codellama|Phind's CodeLlama fine-tune: 34B, excels on HumanEval. [2024-11-22]" ^
    "sqlcoder|Defog's SQLCoder: 7B & 15B for SQL generation. [2025-02-22]" ^
    "codebooga|CodeBooga: 34B merged code model, uncensored. [2025-03-01]" ^
    "stable-code|Stability AI's Stable Code: 3B competitive coding model. [2025-04-01]" ^
    "magicoder|Magicoder: 7B model trained on synthetic code instruction data. [2025-02-15]" ^
    "opencoder|OpenCoder: 1.5B & 8B code models by Woo Jaz. [2025-03-05]" ^
    "dolphincoder|Eric Hartford's DolphinCoder: 7B & 15B uncensored coder. [2025-05-20]" ^
    "codeqwen|Alibaba's CodeQwen1.5: 7B model pretrained on code data. [2025-04-15]" ^
    "deepcoder|DeepCoder: 14B open-source coding model. [2025-04-01]" ^
    "athene-v2|Athene V2: 72B model, excels at code completion. [2025-05-05]" ^
    "devstral|Devstral: 24B model for coding agents. [2025-05-10]" ^
    "yi-coder|01.AI's Yi Coder: Code language models with <10B parameters. [2025-04-22]"
goto menu

:math
call :display_submenu "Math and Reasoning Models" ^
    "deepseek-r1|DeepSeek R1: 1.5B-671B advanced reasoning models. [2025-05-16]" ^
    "deepscaler|DeepScaler: 1.5B fine-tuned reasoning model. [2025-05-16]" ^
    "openthinker|OpenThinker: 7B & 32B reasoning models. [2025-04-22]" ^
    "smallthinker|SmallThinker: 3B fine-tuned from Qwen for reasoning. [2025-04-22]" ^
    "r1-1776|R1-1776: 70B & 671B unbiased reasoning model. [2025-05-16]" ^
    "qwen2-math|Alibaba's Qwen2-Math: 1.5B to 72B math-focused models. [2025-05-01]" ^
    "wizard-math|WizardLM's WizardMath: 7B-70B for math problems. [2025-01-22]" ^
    "mathstral|Mistral AI's Mathstral: 7B model for math reasoning. [2025-05-08]" ^
    "cogito|Cogito: 3B to 70B hybrid reasoning model. [2025-04-15]" ^
    "phi4-reasoning|Microsoft's Phi-4 Reasoning: 14B open-weight reasoning models. [2025-05-15]" ^
    "phi4-mini-reasoning|Microsoft's Phi-4 Mini Reasoning: Lightweight advanced reasoning. [2025-05-17]"
goto menu

:embedding
call :display_submenu "Embedding Models" ^
    "granite-embedding|IBM's Granite Embedding: 30M & 278M models. [2025-04-22]" ^
    "snowflake-arctic-embed2|Snowflake's Arctic Embed2: 568M embedding model. [2025-04-01]" ^
    "mxbai-embed-large|Mixedbread AI's mxbai-embed-large: SOTA 335M model. [2025-05-01]" ^
    "all-minilm|Sentence Transformers' All-MiniLM: 22M & 33M sentence embeddings. [2024-10-22]" ^
    "nomic-embed-text|Nomic Embed: High-performance text embedding model. [2025-03-22]" ^
    "bge-large|BAAI's BGE-Large: 335M text-to-vector model. [2025-02-22]" ^
    "bge-m3|BAAI's BGE-M3: Versatile multilingual embedding model. [2025-04-10]" ^
    "paraphrase-multilingual|Sentence Transformers' Paraphrase Multilingual: For clustering/semantic search. [2024-09-22]"
goto menu

:uncensored
call :display_submenu "Uncensored Models" ^
    "llama2-uncensored|Llama2 Uncensored: Unfiltered 7B & 70B Llama2 versions. [2024-11-22]" ^
    "dolphin-mixtral|Dolphin Mixtral: Uncensored 8x7B & 8x22B models by Eric Hartford. [2025-05-22]" ^
    "dolphin-phi|Eric Hartford's Dolphin Phi: 2.7B uncensored model. [2025-05-20]" ^
    "dolphin-llama3|Eric Hartford's Dolphin Llama3: 8B & 70B versatile uncensored model. [2025-05-20]" ^
    "dolphincoder|Eric Hartford's DolphinCoder: 7B & 15B uncensored coding model. [2025-05-20]" ^
    "wizardlm-uncensored|WizardLM Uncensored: 13B uncensored model. [2024-10-22]" ^
    "wizard-vicuna-uncensored|Wizard Vicuna Uncensored: 7B to 30B model. [2024-09-22]" ^
    "dolphin-mistral|Eric Hartford's Dolphin Mistral: 7B uncensored coder. [2025-05-20]" ^
    "everythinglm|EverythingLM: 13B uncensored model with 16K context. [2025-01-22]"
goto menu

:medical
call :display_submenu "Medical Models" ^
    "medllama2|MedLlama2: Llama2 7B fine-tuned for medical domain. [2024-05-22]" ^
    "meditron|Meditron: 7B & 70B LLMs specialized for medical applications. [2025-01-22]"
goto menu

:specialized
call :display_submenu "Specialized Models" ^
    "llava-phi3|LLaVA-Phi3: 3.8B vision model. [2025-05-08]" ^
    "llava-llama3|LLaVA-Llama3: 8B vision benchmark model. [2025-04-22]" ^
    "moondream|Moondream: Tiny 1.8B vision model for edge devices. [2025-05-12]" ^
    "bakllava|BakLLaVA: 7B multimodal Mistral model for vision. [2025-03-22]" ^
    "nexusraven|NexusRaven: 13B model for function calling. [2025-04-01]" ^
    "granite3.2-vision|IBM's Granite 3.2 Vision: 2B for visual documents. [2025-04-01]" ^
    "llama3.2-vision|Meta's Llama 3.2 Vision: 11B & 90B image reasoning. [2025-04-22]" ^
    "mistral-small3.1|Mistral Small 3.1: 24B with vision capabilities. [2025-02-22]" ^
    "qwen2.5vl|Alibaba's Qwen2.5VL: Flagship vision-language model. [2025-05-01]" ^
    "minicpm-v|MiniCPM-V: Multimodal LLMs for vision-language understanding. [2025-04-15]"
goto menu

:display_submenu
setlocal
set "category=%~1"
shift
set /a option_count=0
:options_loop
if "%~1"=="" goto prepare_display
for /f "tokens=1,2 delims=|" %%a in ("%~1") do (
    set /a option_count+=1
    set "option!option_count!_name=%%a"
    set "option!option_count!_desc=%%b"
)
shift
goto options_loop

:prepare_display
set "max_length=0"
for /l %%i in (1,1,!option_count!) do (
    set "label=%%i. !option%%i_name!"
    call :strlen label
    if !strlen! gtr !max_length! set "max_length=!strlen!"
)
set /a "pad_length=max_length+4"

:display_menu
cls
echo ==============================
echo    %category%
echo ==============================
for /l %%i in (1,1,!option_count!) do (
    set "opt_label=%%i. !option%%i_name!"
    call :strlen opt_label
    set /a spaces_needed=pad_length - strlen
    if !spaces_needed! lss 0 set spaces_needed=0
    set "spaces="
    for /l %%s in (1,1,!spaces_needed!) do set "spaces=!spaces! "
    echo !opt_label!!spaces! !option%%i_desc!"
)
set /a back_index=option_count+1
echo !back_index!. Back to Main Menu
echo.
set "choice="
set /p choice="Enter your choice (1-!back_index!): "

if "!choice!"=="!back_index!" goto :eof
if !choice! geq 1 if !choice! leq !option_count! (
    call :run_model "!option%choice%_name!"
) else (
    echo Invalid choice. Press any key to try again.
    pause >nul
)
goto display_menu

:run_model
setlocal enabledelayedexpansion
set "model_name=%~1"
set "model_name=!model_name: =!"
:run_model_menu
cls
echo ==============================
echo       Run Options for !model_name!
echo ==============================
echo 1. Run with Ollama
echo 2. Run with INTERPRETER
echo 3. Back to Previous Menu
echo.
set "subchoice="
set /p subchoice="Enter your choice (1-3): "

if "!subchoice!"=="3" goto :eof
if "!subchoice!"=="2" (
    echo Running command: start cmd /k interpreter --model ollama/!model_name!
    start cmd /k interpreter --model ollama/!model_name!
)
if "!subchoice!"=="1" (
    echo Running command: start cmd /k ollama run !model_name!
    start cmd /k ollama run !model_name!
)
if "!subchoice!" neq "1" if "!subchoice!" neq "2" if "!subchoice!" neq "3" (
    echo Invalid choice. Press any key to try again.
    pause >nul
    goto run_model_menu
)
goto run_model_menu

:strlen
setlocal enabledelayedexpansion
set "s=!%1!"
set "len=0"
for %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
    if not "!s:~%%N,1!"=="" (
        set /a "len+=%%N"
        set "s=!s:~%%N!"
    )
)
endlocal & set strlen=%len%
goto :eof
