#!/bin/bash

# Setup script for Ultrasaurus Blog static site
echo "🦕 Setting up Ultrasaurus Blog..."

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p _posts
mkdir -p _layouts
mkdir -p assets
mkdir -p about
mkdir -p .github/workflows

# Check if Ruby is installed
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby is not installed. Please install Ruby 2.7 or higher."
    echo "   Visit: https://www.ruby-lang.org/en/documentation/installation/"
    exit 1
fi

# Check if Bundler is installed
if ! command -v bundle &> /dev/null; then
    echo "📦 Installing Bundler..."
    gem install bundler
fi

# Install Jekyll dependencies
if [ -f "Gemfile" ]; then
    echo "📦 Installing Jekyll and dependencies..."
    bundle install
else
    echo "❌ Gemfile not found. Please make sure all files are in place."
    exit 1
fi

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    echo "🔧 Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit: Ultrasaurus blog setup"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Run 'bundle exec jekyll serve' to start local development server"
echo "2. Visit http://localhost:4000 to see your site"
echo "3. Add more posts in the _posts/ directory"
echo "4. Push to GitHub and enable Pages for automatic deployment"
echo ""
echo "📖 See README.md for detailed instructions"