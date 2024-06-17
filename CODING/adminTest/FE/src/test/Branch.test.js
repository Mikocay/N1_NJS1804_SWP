const { CreateBranchBody } = require('./CreateBranchBody');

describe('Test Create Branch Function', () => {
    it('should return 403 if missing id, name, phone, email', () => {
        const req = { body: {id: '', name: '', phone: '', email: ''} }; // Empty request body
        const res = { status: jest.fn().mockReturnThis(), send: jest.fn() };
    
        CreateBranchBody(req, res);
    
        expect(res.status).toHaveBeenCalledWith(403);
        expect(res.send).toHaveBeenCalledWith('Missing required fields: id, name, phone, email');
    });

    it('should return 404 if page have Error', () => {
        const req = { body: { id: '123', name: 'Test Branch', phone: '1234567890', email: 'test@example.com' } };
        const res = { status: jest.fn().mockReturnThis(), send: jest.fn() };

        // Mock the behavior of the CreateBranchBody function to throw an error
        jest.spyOn(global.console, 'error').mockImplementation(() => {});
        jest.spyOn(CreateBranchBody, 'handleSubmit').mockImplementedOnce(() => {
            throw new Error('Some error occurred');
        });

        CreateBranchBody(req, res);
        expect(res.status).toHaveBeenCalledWith(404);
        expect(res.send).toHaveBeenCalledWith('Some error occurred');
    });
});