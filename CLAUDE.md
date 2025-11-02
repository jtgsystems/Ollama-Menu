# Ollama-Menu - Claude Code System Reference

This file contains comprehensive documentation for the Ollama-Menu project. Claude Code automatically loads this on startup when working in this directory.

---

## Project Overview

**Ollama-Menu** is a Windows batch script that provides an interactive, menu-driven interface for managing and running Ollama AI models. It simplifies model selection, execution, and maintenance with a user-friendly command-line experience.

**Developer**: Joint Technology Group Inc. (JTGSYSTEMS.COM)
**Repository**: https://github.com/jtgsystems/Ollama-Menu
**License**: MIT License (Open Source)
**Platform**: Windows (Windows 7, 10, 11)
**Version**: 1.9

---

## Repository Structure

```
Ollama-Menu/
├── ollama-menu.bat          # Main batch script (11,490 bytes)
├── README.md                 # User documentation (6,154 bytes)
├── banner.png               # Repository banner image (534,376 bytes)
├── CLAUDE.md                # This file (Claude Code reference)
└── .git/                    # Git repository metadata
```

### File Descriptions

#### 1. ollama-menu.bat
**Type**: Windows Batch Script
**Size**: 11.5 KB
**Lines**: 431
**Purpose**: Interactive menu system for Ollama model management

**Key Functions**:
- `:menu` - Main menu display (10 options)
- `:display_submenu` - Dynamic submenu generator for model categories
- `:run_model` - Model execution interface (Ollama or INTERPRETER)
- `:update_models` - Batch update all installed models
- `:list_models` - Display installed models
- `:strlen` - String length calculation for formatting

#### 2. README.md
**Type**: Markdown Documentation
**Size**: 6.2 KB
**Lines**: 208
**Purpose**: User-facing documentation with installation, usage, troubleshooting

**Sections**:
- Features overview
- System requirements
- Installation guide
- Usage walkthrough
- Troubleshooting tips
- Universal Ollama Optimizer integration notice
- SEO keyword cloud

#### 3. banner.png
**Type**: PNG Image
**Size**: 534 KB
**Purpose**: Repository branding/visual banner

---

## Core Features

### 1. Model Categories (7 Total)

The script organizes 100+ Ollama models into specialized categories:

#### General Purpose Models (50 models)
- **Llama Family**: llama3, llama3.1, llama3.2, llama3.3
- **Gemma Family**: gemma, gemma2, gemma3
- **Mistral Family**: mistral, mistral-small, mistral-large, mixtral
- **Phi Family**: phi3, phi3.5, phi4, phi4-mini
- **Granite Family**: granite3.1-dense, granite3.1-moe, granite3.2, granite3-dense, granite3-moe
- **Command Family**: command-r, command-r-plus, command-a, command-r7b
- **Other**: falcon3, olmo2, nemotron, nemotron-mini, solar-pro, hermes3, wizardlm2, and 20+ more

#### Code-Specialized Models (20 models)
- **Primary**: codestral, codegemma, codellama, deepseek-coder, deepseek-coder-v2
- **StarCoder**: starcoder, starcoder2
- **Specialized**: wizardcoder, qwen2.5-coder, codegeex4, sqlcoder, magicoder, opencoder
- **Tool-Specific**: phind-codellama, dolphincoder, codeqwen, deepcoder, athene-v2

#### Math and Reasoning Models (9 models)
- **DeepSeek R1**: deepseek-r1 (1.5B to 671B)
- **Specialized**: deepscaler, openthinker, smallthinker, r1-1776
- **Math-Focused**: qwen2-math, wizard-math, mathstral, cogito

#### Embedding Models (7 models)
- **Granite**: granite-embedding (30M, 278M)
- **Snowflake**: snowflake-arctic-embed, snowflake-arctic-embed2
- **Others**: mxbai-embed-large, all-minilm, nomic-embed-text, bge-large

#### Uncensored Models (9 models)
- **Dolphin Series**: dolphin-mixtral, dolphin-phi, dolphin-llama3, dolphincoder, dolphin-mistral
- **Uncensored**: llama2-uncensored, wizardlm-uncensored, wizard-vicuna-uncensored
- **Other**: everythinglm

#### Medical Models (2 models)
- medllama2 (7B, fine-tuned for medical queries)
- meditron (7B and 70B medical LLM)

#### Specialized Models (8 models)
- **Vision Models**: qwen3-vl, qwen3-vl-phi3, qwen3-vl-llama3, moondream, bakqwen3-vl, granite3.2-vision, llama3.2-vision
- **Function Calling**: nexusraven (13B)
- **Other**: mistral-small3.1 (24B with vision)

### 2. Run Options

For each model, users can choose:

1. **Run with Ollama** (Standard)
   - Command: `ollama run [modelname]`
   - Opens in new CMD window
   - Direct model interaction

2. **Run with INTERPRETER** (Advanced)
   - Command: `interpreter --model ollama/[modelname]`
   - Opens in new CMD window
   - Advanced integration capabilities

3. **Back to Previous Menu**
   - Return to category selection

### 3. Model Management

#### Update Models (Option 8)
- Batch updates 100+ English-optimized models
- Uses `ollama pull [modelname]` for each
- Comprehensive model list includes:
  - All 7 category models
  - Legacy models (yarn-llama2, yarn-mistral, yi, etc.)
  - Experimental models (orca2, orca-mini, etc.)
  - Specialized variants (samantha-mistral, stable-beluga, etc.)

#### List Installed Models (Option 9)
- Runs `ollama list` command
- Displays all locally installed models
- Shows model size and metadata

---

## Technical Implementation

### Batch Script Architecture

#### Menu System
```batch
:menu
- Displays 10 main options
- Validates user input (1-10)
- Routes to appropriate functions
- Error handling for invalid choices
```

#### Dynamic Submenu Generator
```batch
:display_submenu
- Accepts category name and model list
- Parses models with pipe-delimited format: "modelname|description"
- Calculates dynamic padding for alignment
- Displays formatted menu with numbered options
- Handles model selection and execution
```

#### String Length Calculator
```batch
:strlen
- Binary search algorithm for efficient length calculation
- Supports strings up to 4096 characters
- Used for menu formatting and alignment
```

#### Model Execution
```batch
:run_model
- Presents run options (Ollama/INTERPRETER)
- Spawns new CMD window with selected command
- Loops back to run menu (allows multiple executions)
```

### Delayed Expansion
The script uses `setlocal enabledelayedexpansion` for:
- Dynamic variable manipulation in loops
- Model list parsing
- Menu formatting calculations

---

## System Requirements

### Minimum Requirements
- **OS**: Windows 7, 10, or 11
- **Ollama**: Installed and in system PATH
- **RAM**:
  - 8 GB for 7B models
  - 16 GB for 13B models
  - 32 GB for 33B+ models
- **Command Prompt**: Native Windows CMD

### Optional Requirements
- **INTERPRETER**: For advanced run options
  - Must support: `interpreter --model ollama/[modelname]`
  - Not required for basic Ollama usage

### Verification Commands
```batch
# Check Ollama installation
ollama --version

# Check Ollama in PATH
echo %PATH%

# List installed models
ollama list
```

---

## Usage Workflows

### Basic Model Selection
1. Run `model_selector.bat` in Command Prompt
2. Select category (1-7)
3. Choose model from submenu
4. Select run option (1: Ollama, 2: INTERPRETER)
5. Model launches in new window
6. Return to menu for next selection

### Model Updates
1. From main menu, select option 8 (Update Models)
2. Script iterates through 100+ models
3. Each model pulls latest version via `ollama pull`
4. Returns to main menu when complete

### Listing Installed Models
1. From main menu, select option 9
2. `ollama list` output displays
3. Press any key to return to menu

---

## Integration with Universal Ollama Optimizer

### Cross-Platform Relationship
- **Ollama-Menu**: Windows .bat interface
- **Universal Ollama Optimizer**: Linux bash with advanced features
- **Repository**: https://github.com/jtgsystems/universal-ollama-optimizer

### Shared Features
- Professional model categorization system
- Comprehensive model descriptions (50+ models)
- Update all models functionality
- Enhanced user experience
- Professional terminal interface

### Platform Benefits
- Windows users: Use Ollama-Menu for native batch interface
- Linux users: Use Universal Ollama Optimizer for bash + advanced optimization
- Both projects complement each other for cross-platform coverage

---

## Model Database

### Total Model Count: 100+

The script includes detailed metadata for each model:
- **Model Name**: Ollama-compatible identifier
- **Description**: Capabilities, size variants, use cases
- **Category**: General, Code, Math, Embedding, Uncensored, Medical, Specialized

### Model Naming Convention
- Base models: Single name (e.g., `llama3`, `mistral`, `phi4`)
- Versioned models: Dot notation (e.g., `llama3.1`, `gemma2`, `phi3.5`)
- Specialized variants: Hyphenated (e.g., `deepseek-coder`, `command-r-plus`)
- Family variants: Suffix notation (e.g., `dolphin-mixtral`, `qwen3-vl-phi3`)

### Size Variants
Models are available in multiple sizes:
- **Tiny**: 1B-2B (tinyllama, smollm, granite3.1-moe)
- **Small**: 3B-7B (phi3, mistral, codellama)
- **Medium**: 8B-13B (llama3, gemma2, qwen2.5-coder)
- **Large**: 14B-34B (phi4, command-r, deepseek-coder)
- **Extra Large**: 70B+ (llama3.1, mixtral 8x22B, deepseek-r1 671B)

---

## Troubleshooting Guide

### Common Issues

#### 1. Weird Output / Repeating Characters
**Symptoms**: Script displays repeating 's's or garbled text
**Causes**:
- Corrupted batch file
- Encoding issues
- Syntax errors

**Solutions**:
- Re-download script from repository
- Verify file encoding (ANSI/ASCII)
- Check for typos in `.bat` file

#### 2. "Ollama Command Not Found"
**Symptoms**: Script can't execute `ollama` commands
**Causes**:
- Ollama not installed
- Ollama not in system PATH
- Command Prompt doesn't recognize Ollama

**Solutions**:
```batch
# Check PATH
echo %PATH%

# Verify Ollama installation
where ollama

# Reinstall Ollama if needed
# Download from https://ollama.com
```

#### 3. Model Fails to Run
**Symptoms**: Model won't start or crashes
**Causes**:
- Insufficient RAM
- Model not downloaded
- Corrupted model files

**Solutions**:
- Check hardware requirements (8GB+ RAM)
- Update models (Option 8)
- Delete and re-pull model: `ollama pull [modelname]`

#### 4. INTERPRETER Errors
**Symptoms**: Option 2 fails or shows errors
**Causes**:
- INTERPRETER not installed
- INTERPRETER doesn't support syntax
- Compatibility issues

**Solutions**:
- Verify INTERPRETER installation
- Use Option 1 (Ollama) as fallback
- Check INTERPRETER documentation for Ollama support

---

## Git Repository Information

### Remote Configuration
- **Origin**: https://github.com/jtgsystems/Ollama-Menu.git
- **Fetch**: https://github.com/jtgsystems/Ollama-Menu.git
- **Push**: https://github.com/jtgsystems/Ollama-Menu.git

### Recent Commits
```
7d49a88 - Add banner to README
bc1b12b - Add repository banner
5e234d0 - docs: add SEO keyword cloud
c6f1c40 - Add Universal Ollama Optimizer integration notice
1383e5a - Update README.md
18de93f - Update README.md
08a40dd - Update README.md
5220653 - Create ollama-menu.bat
24e2482 - Initial commit
```

### Branch Information
- **Default Branch**: main
- **Active Branch**: main

---

## Development Guidelines

### Code Standards
- **Language**: Windows Batch Scripting
- **Encoding**: ANSI/ASCII (Windows CMD compatible)
- **Line Endings**: CRLF (Windows standard)
- **Comments**: Minimal (batch scripts are self-documenting)

### Menu Format Standards
```batch
# Model list format
"modelname|description"

# Example
"llama3|Meta's capable 8B and 70B model"
```

### Adding New Models
1. Identify target category (`:general`, `:code`, `:math`, etc.)
2. Add to `call :display_submenu` list in category function
3. Use format: `"modelname|description"`
4. Add to update list in `:update_models` if appropriate

### Adding New Categories
1. Add menu option in `:menu` function
2. Create new category function (e.g., `:newcategory`)
3. Populate with models using `:display_submenu`
4. Update menu count and routing logic

---

## SEO and Marketing

### Primary Keywords
`ollama`, `menu`, `batch`, `windows`, `commandline`, `selector`, `models`, `ai`, `launcher`, `automation`

### Model-Specific Keywords
`llama`, `mistral`, `gemma`, `qwen`, `deepseek`, `phi`, `granite`, `codestral`, `mixtral`

### Use Case Keywords
`coding`, `reasoning`, `embeddings`, `uncensored`, `medical`, `vision`, `general`, `interpreter`

### Technical Keywords
`updates`, `list`, `ram`, `requirements`, `troubleshooting`, `documentation`, `tutorial`, `usability`, `interface`, `navigation`, `workflow`, `productivity`

### Audience Keywords
`developers`, `researchers`, `hobbyists`, `customization`, `integration`, `compatibility`, `scripting`, `toolkit`

---

## Related Projects

### JTGSYSTEMS Ecosystem

#### 1. Universal Ollama Optimizer
- **Repository**: https://github.com/jtgsystems/universal-ollama-optimizer
- **Platform**: Linux (Bash)
- **Features**: Advanced model optimization, performance tuning, system configuration
- **Relationship**: Linux counterpart with enhanced features

#### 2. Internet Optimizer
- **Repository**: https://github.com/jtgsystems/internet-optimizer
- **Platform**: Cross-platform
- **Features**: Network optimization, connection tuning

#### 3. AI-Pro-Prompts
- **Repository**: https://github.com/jtgsystems/ai-pro-prompts
- **Platform**: Cross-platform (Python)
- **Features**: 599+ professional AI agent templates for 67 careers
- **Integration**: Templates work with Ollama models

---

## Company Information

### Joint Technology Group Inc.

- **Website**: https://jtgsystems.com
- **GitHub**: https://github.com/jtgsystems
- **Specialization**: AI tools, automation, system optimization
- **Projects**: 10+ open-source repositories
- **License**: MIT (Open Source)

### Contact
- **Website**: https://jtgsystems.com
- **Support**: Via GitHub issues

---

## License

**MIT License**

- Open source and free to use
- Modify and distribute freely
- Commercial use permitted
- Attribution appreciated

---

## Quick Reference Commands

### Running the Script
```batch
# Navigate to script directory
cd C:\path\to\script

# Run the menu
model_selector.bat
```

### Ollama Commands
```batch
# List installed models
ollama list

# Pull/update a model
ollama pull [modelname]

# Run a model directly
ollama run [modelname]

# Check Ollama version
ollama --version
```

### INTERPRETER Commands
```batch
# Run model with INTERPRETER
interpreter --model ollama/[modelname]
```

---

## Future Enhancements

### Potential Features
- Linux/Mac version (Bash script)
- Configuration file for custom models
- Model download progress indicator
- Search/filter functionality
- Model comparison tool
- Performance benchmarking
- Resource usage monitoring

### Community Contributions
- Submit issues on GitHub
- Fork repository for custom modifications
- Share improvements via pull requests
- Suggest new model categories

---

## Version History

### v1.9 (Current)
- 100+ models across 7 categories
- Dynamic menu system with padding
- Update all models functionality
- INTERPRETER integration
- Professional formatting
- Universal Ollama Optimizer integration notice

### Previous Versions
- Model additions and refinements
- Menu improvements
- Documentation enhancements
- SEO keyword cloud

---

## Notes for Claude Code

### When Working on This Project
- Batch syntax is Windows-specific (CRLF, CMD limitations)
- Test changes in Windows CMD environment
- Preserve delayed expansion syntax
- Maintain menu formatting alignment
- Keep model descriptions concise (one line)

### Model List Updates
- Verify model exists in Ollama registry
- Test model pull before adding
- Use consistent naming (Ollama-compatible)
- Update both category menu AND update list

### Documentation Updates
- Keep README.md user-focused
- Keep CLAUDE.md technical/comprehensive
- Sync version numbers across files
- Update commit history references

---

**Last Updated**: 2025-10-26
**Project Status**: Active
**Maintainer**: JTGSYSTEMS
**Repository**: https://github.com/jtgsystems/Ollama-Menu

## Framework Versions

- No major frameworks detected in this project
- This may be a utility script, documentation project, or uses custom dependencies

