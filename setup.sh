# Create master setup script
cat > MASTER_SETUP.sh << 'EOF'
#!/bin/bash

echo "========================================"
echo "  CYBER-DOJO COMPLETE PROJECT SETUP"
echo "========================================"

echo "This script will create the complete Cyber-Dojo project."
echo "It includes:"
echo "  • README.md - Project overview"
echo "  • INSTRUCTIONS.md - Step-by-step guide"
echo "  • SOLUTIONS.md - Complete solutions"
echo "  • All necessary .sh scripts"
echo "  • Data files and documentation"
echo ""
read -p "Continue? (y/n): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Setup cancelled."
    exit 1
fi

# Run the create_project.sh script
./create_project.sh

echo ""
echo "========================================"
echo "  SETUP COMPLETE!"
echo "========================================"
echo ""
echo "Your Cyber-Dojo project is ready!"
echo ""
echo "Next steps:"
echo "1. Review the project:"
echo "   cat README.md"
echo "   less INSTRUCTIONS.md"
echo ""
echo "2. Initialize the environment:"
echo "   ./setup_scenario.sh"
echo ""
echo "3. Begin with Milestone 1"
echo ""
echo "4. Check your progress:"
echo "   ./check_progress.sh"
echo ""
echo "Need help? Check SOLUTIONS.md for guidance."
echo "========================================"
EOF

chmod +x MASTER_SETUP.sh
