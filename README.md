# Gutachtensil-Expert-QA-System

**English** | [中文](#系统简介)

## Introduction

Gutachtensil-Expert-QA-System is an expert question-answering system built entirely using Prolog. It leverages Prolog's logical reasoning capability to provide accurate and efficient answers to complex queries. 

---

## Features

- **Expert-Level Question Answering**: Uses logical reasoning to answer complex questions.
- **Prolog-Based**: Built entirely with Prolog for robust rule-based reasoning.
- **Modular Design**: Easily extendable for integrating knowledge across multiple domains.
- **Efficient Inference**: Optimized algorithms for fast and accurate responses.

---

## Installation and Usage

### 1. Prerequisites
Ensure you have Prolog installed. You can download it from the [SWI-Prolog website](https://www.swi-prolog.org/).

### 2. Clone the Repository
```bash
git clone https://github.com/JacquotQ/Gutachtensil-Expert-QA-system.git
cd Gutachtensil-Expert-QA-system
```

### 3. Run the System
Start the Prolog interactive environment:
```bash
swipl gutachtensil.pl
```

Load the main program:
```prolog
?- consultation_loop.
```

Answer your question:
```prolog
?- answer.
```

---

## Example Usage

```prolog
'是否有合同？即合同是否签订，存在书面或口头的合同，如果不确定，请回答not sure进入下一个问题'.
｜：yes.
'合同只要成立，依据中华人民共和国民法典第502条....'

逻辑推理路径
root_is_contract_established-->is_contract_invalid-->request_right_ot_existed
true.
```

---

## Contributing

We welcome contributions to this project! Here's how you can help:
1. Submit issues or suggestions.
2. Create pull requests to improve the codebase.
3. Extend the knowledge base with additional domain-specific content.

Please follow the [Contributing Guidelines](CONTRIBUTING.md) (if available).

---

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute it, but please retain the original license file.

---

## Contact

If you have any questions or suggestions, feel free to reach out:
- GitHub: [JacquotQ](https://github.com/JacquotQ)
- Email: jonstark186@gmail.com

---

# 系统简介

Gutachtensil-Expert-QA-System 是一个完全基于 Prolog 的专家问答系统，利用逻辑推理能力为复杂问题提供准确高效的解答。

---

## 功能特点

- **专家级问答**：通过逻辑推理解答复杂问题。
- **完全基于 Prolog**：利用 Prolog 的规则推理能力构建。
- **模块化设计**：轻松扩展，支持多领域知识的集成。
- **高效推理**：优化算法，提供快速且精准的响应。

---

## 安装与运行

### 1. 安装依赖

确保您已安装 Prolog。可以从 [SWI-Prolog 官网](https://www.swi-prolog.org/) 下载。

### 2. 克隆仓库

```bash
git clone https://github.com/JacquotQ/Gutachtensil-Expert-QA-system.git
cd Gutachtensil-Expert-QA-system
```

### 3. 启动系统

运行以下命令进入 Prolog 交互环境：

```bash
swipl gutachtensil.pl
```

加载主程序：

```prolog
?- consultation_loop.
```

开始回答：

```prolog
?- answer.
```

---

## 示例用法

```prolog
'是否有合同？即合同是否签订，存在书面或口头的合同，如果不确定，请回答not sure进入下一个问题'.
｜：yes.
'合同只要成立，依据中华人民共和国民法典第502条....'

逻辑推理路径
root_is_contract_established-->is_contract_invalid-->request_right_ot_existed
true.
```

---

## 贡献指南

欢迎对本项目进行贡献！您可以通过以下方式参与：
1. 提交 Issue 或建议。
2. 提交 Pull Request 改进代码。
3. 扩展知识库，增加更多领域的内容。

请确保遵循 [贡献指南](CONTRIBUTING.md)（如果有）。

---

## 许可证

本项目采用 [MIT License](LICENSE)。您可以自由使用、修改和分发，但请保留原始许可证文件。

---

## 联系方式

如果您有任何问题或建议，可以通过以下方式联系我：
- GitHub: [JacquotQ](https://github.com/JacquotQ)
- 邮箱: jonstark186@gmail.com

---

希望这个双语版 README 文件符合您的需求！如果需要进一步修改或补充，请随时告诉我！
