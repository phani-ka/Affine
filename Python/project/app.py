from flask import Flask, render_template, request, jsonify
from textblob import TextBlob
import nltk
from nltk.tokenize import word_tokenize, sent_tokenize
from nltk.tag import pos_tag
from nltk.chunk import ne_chunk
from collections import Counter

app = Flask(__name__)

# Download required NLTK data
nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')
nltk.download('maxent_ne_chunker')
nltk.download('words')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/analyze', methods=['POST'])
def analyze_text():
    text = request.form.get('text')
    
    if not text or len(text) < 10:
        return jsonify({'error': 'Please enter at least 10 characters'})
    
    try:
        # Create TextBlob object
        blob = TextBlob(text)
        
        # Sentiment analysis
        sentiment = blob.sentiment
        polarity = sentiment.polarity  # -1 to 1
        subjectivity = sentiment.subjectivity  # 0 to 1
        
        if polarity > 0.1:
            sentiment_label = "Positive"
        elif polarity < -0.1:
            sentiment_label = "Negative"
        else:
            sentiment_label = "Neutral"
        
        # Tokenization and POS tagging
        tokens = word_tokenize(text)
        pos_tags = pos_tag(tokens)
        
        # Named entity recognition
        ner_tags = ne_chunk(pos_tags)
        
        # Extract entities
        entities = []
        for chunk in ner_tags:
            if hasattr(chunk, 'label'):
                entities.append({
                    'text': ' '.join(c[0] for c in chunk),
                    'type': chunk.label()
                })
        
        # Get most common nouns
        nouns = [word for (word, pos) in pos_tags if pos.startswith('NN')]
        common_nouns = Counter(nouns).most_common(5)
        
        # Get key phrases (top sentences by length)
        sentences = sent_tokenize(text)
        key_phrases = sorted(sentences, key=lambda x: len(x), reverse=True)[:3]
        
        # Prepare response
        result = {
            'sentiment': sentiment_label,
            'polarity': polarity,
            'subjectivity': subjectivity,
            'entities': entities,
            'common_nouns': [noun[0] for noun in common_nouns],
            'key_phrases': key_phrases,
            'word_count': len(tokens),
            'sentence_count': len(sentences),
            'avg_word_length': sum(len(word) for word in tokens)/len(tokens) if tokens else 0
        }
        
        return jsonify(result)
        
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)