# Intelligent Query-Retrieval System API

This repository contains the backend API for an advanced, LLM-powered query-retrieval system. The application is designed to process large, unstructured documents (like insurance policies or legal contracts) and provide precise, context-aware answers to complex natural language questions with high accuracy and low latency.

## 🚀 Live Demo

You can interact with this backend through our deployed Streamlit web interface:

[**➡️ Click here to view the live application**](https://intelligent-query-retrieval-system-ui.streamlit.app/)

## ✨ Features

- **High-Speed RAG Pipeline:** Implements an advanced Retrieval-Augmented Generation (RAG) architecture to deliver accurate, fact-based answers.
- **Persistent Vector Storage:** Utilizes a **Pinecone** vector database to store document embeddings permanently, ensuring ultra-fast responses on subsequent queries.
- **State-of-the-Art Accuracy:** Integrates a **Cohere Re-ranker** to refine search results, dramatically improving retrieval accuracy and reducing LLM hallucinations.
- **Real-time Performance:** Powered by the high-speed **Groq (Llama 3)** inference engine, enabling complex analysis in seconds.
- **Secure & Robust API:** Built with **FastAPI**, featuring secure bearer token authentication and robust error handling.
- **Dynamic Document Processing:** Capable of ingesting and indexing any publicly accessible PDF or DOCX document on-the-fly.

## 🛠️ Tech Stack

- **Backend:** Python, FastAPI
- **LLM Engine:** Groq (Llama 3)
- **Vector Database:** Pinecone
- **Embedding Model:** `sentence-transformers/all-MiniLM-L6-v2`
- **Re-ranker:** Cohere
- **Deployment:** Docker, Hugging Face Spaces
- **Core Libraries:** LlamaIndex, Uvicorn, Gunicorn

## ⚙️ Setup and Local Installation

To run this project on your local machine, please follow these steps.

### Prerequisites

- Python 3.11
- Docker Desktop (running)
- Git

### 1\. Clone the Repository

```bash
git clone https://github.com/arbin-mahato/Intelligent-Query-Retrieval-System.git
cd Intelligent-Query-Retrieval-System
```

### 2\. Configure Environment Variables

1.  Create a `.env` file in the root of the project.

2.  Add your secret API keys to this file. You will need to get these from their respective platforms (Groq, Pinecone, Cohere).

    ```
    # .env
    GROQ_API_KEY="your-groq-api-key"
    PINECONE_API_KEY="your-pinecone-api-key"
    PINECONE_INDEX_HOST="your-pinecone-index-host"
    COHERE_API_KEY="your-cohere-api-key"
    ```

### 3\. Create a Virtual Environment

```bash
# For Windows
py -3.11 -m venv venv
.\venv\Scripts\Activate.ps1

# For macOS/Linux
python3.11 -m venv venv
source venv/bin/activate
```

### 4\. Install Dependencies

```bash
pip install -r requirements.txt
```

### 5\. Run the Application

```bash
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

The API will now be running and accessible at `http://localhost:8000`.

## 🔭 Future Scope

This project provides a powerful foundation for a production-grade document analysis tool. Here are some potential future enhancements:

- **Multi-Document Analysis:** Extend the system to support querying across a collection of multiple documents simultaneously, enabling cross-referencing and comparative analysis.
- **User Authentication & History:** Implement a full user authentication system to allow users to manage their own document libraries and view their query history.
- **Enhanced Document Loaders:** Add support for a wider range of document types, including `.txt`, `.csv`, and direct web page scraping.
- **Conversational Memory:** Integrate a memory component to allow for follow-up questions, creating a more natural, conversational experience (e.g., "Can you elaborate on your last answer?").
- **Advanced Analytics Dashboard:** Build a dashboard for users to see analytics on their queried documents, such as key themes, frequently asked questions, and extracted entities.
